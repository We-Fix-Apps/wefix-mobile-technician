import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:multiple_image_camera/camera_file.dart';
import 'package:multiple_image_camera/multiple_image_camera.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:record/record.dart';
import 'package:syncfusion_flutter_signaturepad/signaturepad.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../core/constant/app_image.dart';
import '../../../core/context/global.dart';
import '../../../core/extension/gap.dart';
import '../../../core/function/app_size.dart';
import '../../../core/function/image_picker_class.dart';
import '../../../core/providers/app_text.dart';
import '../../../core/providers/language_provider/l10n_provider.dart';
import '../../../core/services/hive_services/box_kes.dart';
import '../../../core/unit/app_color.dart';
import '../../../core/unit/app_text_style.dart';
import '../../../core/widget/button/app_button.dart';
import '../../../core/widget/widget_daialog.dart';
import '../../../core/widget/widget_dropdown.dart';
import '../../../core/widget/widget_text_field.dart';
import '../../../injection_container.dart';
import '../../auth/domain/usecase/auth_usecase.dart';
import '../domain/model/maintenances_list_model.dart';
import '../domain/model/params/create_material_params.dart';
import '../domain/model/params/create_tools_params.dart';
import '../domain/model/params/maintenanc_params.dart';
import '../domain/model/tickets_details_model.dart';
import '../domain/ticket_enum.dart';
import '../domain/usecase/ticket_usecase.dart';
import '../widgets/widget_attchmants.dart';
import '../widgets/widget_completion_attchment.dart';

class TicktesDetailsController extends ChangeNotifier with WidgetsBindingObserver {
  final TicketUsecase ticketUsecase;
  final AuthUsecase authUsecase;

  // * ============================== Ticket Details ==============================
  ValueNotifier<TicketStatus> ticketStatue = ValueNotifier(TicketStatus.init);
  ValueNotifier<StartTicketStatus> startTicketStatue = ValueNotifier(StartTicketStatus.init);
  ValueNotifier<CompleteTicketStatus> completeTicketStatue = ValueNotifier(CompleteTicketStatus.init);
  TicketsDetails? ticketsDetails;
  bool recording = false;
  File? filePath;
  Timer? timer;
  Map audioRecord = {'path': '', 'duration': 0, 'stop': false};
  String? audio;
  ValueNotifier<int> duration = ValueNotifier(0);
  final record = AudioRecorder();

  // * ============================== Tools ==============================
  ValueNotifier<List<TicketTool>> tools = ValueNotifier([]);
  ValueNotifier<List<TicketTool>> selecteddTool = ValueNotifier([]);
  ValueNotifier<ToolStatus> toolsStatus = ValueNotifier(ToolStatus.init);
  ValueNotifier<AddToolsStatus> toolsAddStatus = ValueNotifier(AddToolsStatus.init);

  // * ============================== Materials ==============================
  ValueNotifier<List<TicketMaterial>> materials = ValueNotifier([]);
  ValueNotifier<List<TicketMaterial>> selectedMaterial = ValueNotifier([]);
  ValueNotifier<MaterilsStatus> materilsStatus = ValueNotifier(MaterilsStatus.init);
  ValueNotifier<DeleteMaterilsStatus> deleteMaterilsStatus = ValueNotifier(DeleteMaterilsStatus.init);
  ValueNotifier<AddMaterilsStatus> addMaterilsStatus = ValueNotifier(AddMaterilsStatus.init);
  String? signatureImage;
  // * ============================== Completion CheckList ==============================
  PageController pageController = PageController(viewportFraction: 1, initialPage: 0);
  ValueNotifier<List<String>> images = ValueNotifier([]);
  ValueNotifier<List<String>> imagesAttachment = ValueNotifier([]);
  TextEditingController note = TextEditingController();
  TextEditingController noteCompleted = TextEditingController();
  ValueNotifier<List<MaintenancesList>> completionChecklist = ValueNotifier([]);
  ValueNotifier<UpdateMaintenancesStatus> updateMaintenancesStatus = ValueNotifier(UpdateMaintenancesStatus.init);
  ValueNotifier<MaintenancesStatus> maintenancesStatusStatus = ValueNotifier(MaintenancesStatus.init);
  ValueNotifier<int> rate = ValueNotifier(0);
  TextEditingController name = TextEditingController();
  ValueNotifier<List<dynamic>> types = ValueNotifier(['Test 1', 'Test 2', 'Test 3']);
  ValueNotifier<Choice> selectedtype = ValueNotifier(const Choice());

  TicktesDetailsController({required this.ticketUsecase, required this.authUsecase}) {
    WidgetsBinding.instance.addObserver(this);
    getType();
  }
  final GlobalKey<SfSignaturePadState> signatureGlobalKey = GlobalKey();

  // * ============================== Ticket Details ==============================

  void _startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      duration.value = duration.value + 1;
      sl<Box>(instanceName: BoxKeys.appBox).put('duration', duration.value);
      notifyListeners();
    });
    notifyListeners();
  }

  void _stopTimer() {
    timer?.cancel();
    duration.value = 0;
    sl<Box>(instanceName: BoxKeys.appBox).put('duration', '0');
    timer = null;
    notifyListeners();
  }

  // ! Function get ticket details
  Future<void> ticketDetails(String id) async {
    try {
      ticketStatue.value = TicketStatus.loading;
      final result = await ticketUsecase.ticketDetails(id);
      result.fold(
        (l) {
          ticketStatue.value = TicketStatus.failure;
          SmartDialog.show(
            builder:
                (context) => WidgetDilog(
                  isError: true,
                  title: AppText(context).warning,
                  message: l.message,
                  cancelText: AppText(context).back,
                  onCancel: () => SmartDialog.dismiss(),
                ),
          );
        },
        (r) {
          ticketsDetails = r.data;
          // Selected Tools
          List<TicketTool> selectedTools = [];
          for (TicketTool element in ticketsDetails?.ticketTools ?? []) {
            selectedTools.add(element);
          }
          selecteddTool.value = List.from(selectedTools);
          // Selected Material
          List<TicketMaterial> selectedMaterials = [];
          for (TicketMaterial element in ticketsDetails?.ticketMaterials ?? []) {
            selectedMaterials.add(element);
          }
          selectedMaterial.value = List.from(selectedMaterials);
          // Completion Checklist
          List<String> selectedIMAGE = [];
          selectedIMAGE = List.from(ticketsDetails?.ticketImages ?? []);
          imagesAttachment.value = List.from(selectedIMAGE);

          ticketStatue.value = TicketStatus.success;
          notifyListeners();
        },
      );
    } catch (e) {
      ticketStatue.value = TicketStatus.failure;
      log('Server Error in section Get ticket details : $e');
    }
  }

  // ! Function get start ticket
  Future<void> startTicket(String id) async {
    try {
      final result = await ticketUsecase.startTickets(id);
      result.fold(
        (l) {
          startTicketStatue.value = StartTicketStatus.failure;
          SmartDialog.show(
            builder:
                (context) => WidgetDilog(
                  isError: true,
                  title: AppText(context).warning,
                  message: l.message,
                  cancelText: AppText(context).back,
                  onCancel: () => SmartDialog.dismiss(),
                ),
          );
        },
        (r) {
          startTicketStatue.value = StartTicketStatus.success;
          SmartDialog.dismiss();
          ticketDetails(id);
        },
      );
    } catch (e) {
      startTicketStatue.value = StartTicketStatus.failure;
      log('Server Error in section Get ticket details : $e');
    }
  }

  // ! Function get complete ticket
  Future<void> completeTicket(String id, String link) async {
    try {
      final result = await ticketUsecase.completeTickets(id, noteCompleted.text, signatureImage ?? '', link);
      result.fold(
        (l) {
          SmartDialog.dismiss();
          completeTicketStatue.value = CompleteTicketStatus.failure;
          SmartDialog.show(
            builder:
                (context) => WidgetDilog(
                  isError: true,
                  title: AppText(context).warning,
                  message: l.message,
                  cancelText: AppText(context).back,
                  onCancel: () => SmartDialog.dismiss(),
                ),
          );
        },
        (r) {
          SmartDialog.dismiss();
          completeTicketStatue.value = CompleteTicketStatus.success;
          noteCompleted.clear();
          signatureImage = null;
          GlobalContext.context.pop();
          ticketDetails(id);
        },
      );
    } catch (e) {
      SmartDialog.dismiss();
      completeTicketStatue.value = CompleteTicketStatus.failure;
      log('Server Error in section Get ticket details : $e');
    }
  }

  Future<void> uploadFile({String? id, String? ticketId, File? image, bool? isAdd}) async {
    try {
      File? fileToUpload;
      if (image == null) {
        final dir = await getApplicationDocumentsDirectory();
        final voiceFilePath = audioRecord['path'];

        if (voiceFilePath != null) fileToUpload = File('${dir.path}/$voiceFilePath');
      }
      final result = await authUsecase.uploadFile(image ?? fileToUpload!);
      result.fold(
        (failure) {
          completeTicketStatue.value = CompleteTicketStatus.failure;
          SmartDialog.dismiss();
          SmartDialog.show(
            builder:
                (context) => WidgetDilog(
                  isError: true,
                  title: AppText(context).warning,
                  message: failure.message,
                  cancelText: AppText(context).back,
                  onCancel: () => SmartDialog.dismiss(),
                ),
          );
        },
        (success) async {
          if (id != null) {
            await completeTicket(id, success.data!);
          } else {
            SmartDialog.dismiss();
            if (isAdd == true) {
              List<String> imagesSelected = imagesAttachment.value;
              imagesSelected.add(success.data!);
              imagesAttachment.value = imagesSelected;
              notifyListeners();
            } else {
              List<String> imagesSelected = imagesAttachment.value;
              imagesSelected.add(success.data!);
              images.value = imagesSelected;
              notifyListeners();
            }
            notifyListeners();
          }
        },
      );
    } catch (e, stack) {
      SmartDialog.dismiss();
      completeTicketStatue.value = CompleteTicketStatus.failure;
      log('Upload error: $e\n$stack');
    }
  }

  // ! Function Toggle Tool [ Selected , Not Selected ]
  Future<void> addProviderAttachment(String ticketToolId, List<String> images) async {
    try {
      final result = await ticketUsecase.createTicketImage(ticketToolId.toString(), images);
      result.fold(
        (l) {
          SmartDialog.dismiss();
          SmartDialog.show(
            builder:
                (context) => WidgetDilog(
                  isError: true,
                  title: AppText(context).warning,
                  message: l.message,
                  cancelText: AppText(context).back,
                  onCancel: () => SmartDialog.dismiss(),
                ),
          );
        },
        (r) {
          SmartDialog.dismiss();
        },
      );
    } catch (e) {
      SmartDialog.dismiss();
      log('Server Error in section Get ticket details : $e');
    }
  }

  // ! Start Record
  Future<void> startRecording(String id) async {
    final micStatus = await Permission.microphone.request();

    if (micStatus.isGranted) {
      try {
        SmartDialog.showLoading(msg: AppText(GlobalContext.context, isFunction: true).loading);
        final dir = await getApplicationDocumentsDirectory();
        final path = "${dir.path}/audio_${DateTime.now().millisecondsSinceEpoch}.m4a";
        await record.start(const RecordConfig(), path: path);
        audioRecord['path'] = path.split('/').last;
        _startTimer();
        recording = true;
        notifyListeners();
        startTicket(id);
      } catch (e) {
        _stopTimer();
        SmartDialog.dismiss();
        log("Error starting recording: $e");
      }
    } else if (micStatus.isPermanentlyDenied) {
      SmartDialog.dismiss();
      log("Microphone permission is permanently denied. Redirecting to settings...");
      await openAppSettings();
    } else {
      SmartDialog.dismiss();
      log("Microphone permission was denied.");
    }
  }

  // ! End Record
  Future<void> stopScreenRecord(String id) async {
    try {
      if (recording) {
        SmartDialog.showLoading(msg: AppText(GlobalContext.context, isFunction: true).loading);
        await record.stop();
      }
    } catch (e) {
      SmartDialog.dismiss();
      log("Error stopping recording: $e");
    } finally {
      if (recording) {
        await convertImageToTempFile();
        await uploadFile(id: id);
      }
      recording = false;
      _stopTimer();
      audioRecord['duration'] = duration;
      audioRecord['stop'] = true;
      notifyListeners();
    }
  }

  Future<File?> convertImageToTempFile() async {
    try {
      final data = await signatureGlobalKey.currentState!.toImage(pixelRatio: 3.0);
      final bytes = await data.toByteData(format: ui.ImageByteFormat.png);

      if (bytes != null) {
        Directory tempDir = await getTemporaryDirectory();
        File tempFile = File('${tempDir.path}/temp_image.png');
        await tempFile.writeAsBytes(bytes.buffer.asUint8List());
        await uploadSignature(tempFile);
      }
    } catch (e) {
      log('Error converting image to file: $e');
    }

    return null;
  }

  Future<void> uploadSignature(File signature) async {
    try {
      final result = await authUsecase.uploadFile(signature);
      result.fold(
        (failure) {
          SmartDialog.show(
            builder:
                (context) => WidgetDilog(
                  isError: true,
                  title: AppText(context).warning,
                  message: failure.message,
                  cancelText: AppText(context).back,
                  onCancel: () => SmartDialog.dismiss(),
                ),
          );
        },
        (success) async {
          signatureImage = success.data!;
          notifyListeners();
        },
      );
    } catch (e, stack) {
      log('Upload error: $e\n$stack');
    }
  }

  void bottomSheetCompleteDetails() {
    showModalBottomSheet(
      context: GlobalContext.context,
      isScrollControlled: true,
      useSafeArea: true,
      builder:
          (context) => Container(
            padding: EdgeInsets.only(right: 15, left: 15, top: 10, bottom: MediaQuery.of(context).viewInsets.bottom + 40),
            width: AppSize(context).width,
            decoration: const BoxDecoration(
              color: AppColor.white,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(AppText(context, isFunction: true).complete, style: AppTextStyle.style22B.copyWith(color: AppColor.black)),
                20.gap,
                Text(AppText(context, isFunction: true).note, style: AppTextStyle.style14B),
                5.gap,
                WidgetTextField(AppText(context, isFunction: true).enterYourNotes, maxLines: 3, controller: noteCompleted),
                10.gap,
                Text(AppText(context, isFunction: true).signature, style: AppTextStyle.style14B),
                5.gap,
                Container(
                  height: AppSize(context).height * 0.2,
                  decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
                  child: SfSignaturePad(
                    key: signatureGlobalKey,
                    backgroundColor: Colors.white,
                    strokeColor: Colors.black,
                    minimumStrokeWidth: 1.0,
                    maximumStrokeWidth: 4.0,
                  ),
                ),
                10.gap,
                Row(
                  children: [
                    ValueListenableBuilder(
                      valueListenable: completeTicketStatue,
                      builder:
                          (context, status, child) => Expanded(
                            child: AppButton.text(
                              text: AppText(context, isFunction: true).complete,
                              loading: status == CompleteTicketStatus.loading,
                              onPressed: () async {
                                await stopScreenRecord(ticketsDetails?.id.toString() ?? '1');
                              },
                            ),
                          ),
                    ),
                  ],
                ),
              ],
            ),
          ),
    );
  }

  // * ============================== Attachmants ==============================

  void showAttachmant(BuildContext context) {
    SmartDialog.show(
      builder:
          (context) => WidgetDilog(
            title: AppText(context).attachments,
            message: '',
            contents: [
              ticketsDetails?.ticketAttatchments?.isEmpty ?? true
                  ? Text(AppText(context, isFunction: true).emptyAttachments, style: AppTextStyle.style14B.copyWith(color: AppColor.red))
                  : ListView.separated(
                    itemCount: ticketsDetails!.ticketAttatchments!.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    separatorBuilder: (context, index) => const Divider(),
                    itemBuilder: (context, index) => WidgetAttachmants(url: ticketsDetails!.ticketAttatchments![index].filePath ?? ''),
                  ),
            ],
            cancelText: AppText(context, isFunction: true).close,
            onCancel: () => SmartDialog.dismiss(),
          ),
    );
  }

  void launchAttachmants(String url) async {
    final urls = Uri.parse(url);
    await launchUrl(urls);
  }

  // * ==============================  Launch URL ==============================

  void launchMap() async {
    final url = Uri.parse('https://www.google.com/maps/search/?api=1&query=${ticketsDetails?.latitudel},${ticketsDetails?.longitude}');
    await launchUrl(url, mode: LaunchMode.externalApplication);
  }

  void launchCall() async {
    final url = 'tel:00${ticketsDetails?.mobile?.replaceAll('+', '')}';
    final uris = Uri.parse(url);
    await launchUrl(uris);
  }

  void launchReport() async {
    final url = Uri.parse(ticketsDetails?.reportLink ?? '');
    await launchUrl(url);
  }

  // * ============================== Tools ==============================

  // ! Function Get All Tools
  Future<void> getTools(BuildContext context, String id, List<int> selectedToolsId) async {
    try {
      SmartDialog.showLoading(msg: AppText(context, isFunction: true).loading);
      toolsStatus.value = ToolStatus.loading;
      final result = await ticketUsecase.ticketTools();
      result.fold(
        (l) {
          toolsStatus.value = ToolStatus.failure;
          SmartDialog.dismiss();
          SmartDialog.show(
            builder:
                (context) => WidgetDilog(
                  isError: true,
                  title: AppText(context).warning,
                  message: l.message,
                  cancelText: AppText(context).back,
                  onCancel: () => SmartDialog.dismiss(),
                ),
          );
        },
        (r) {
          tools.value = r.data!;
          for (TicketTool element in tools.value) {
            if (selectedToolsId.contains(element.id)) {
              final currentList = tools.value;
              final updatedMaterial = currentList[tools.value.indexOf(element)].copyWith(isSelect: true);
              final newList = List<TicketTool>.from(currentList);
              newList[tools.value.indexOf(element)] = updatedMaterial;
              tools.value = newList;
            } else {
              final currentList = tools.value;
              final updatedMaterial = currentList[tools.value.indexOf(element)].copyWith(isSelect: false);
              final newList = List<TicketTool>.from(currentList);
              newList[tools.value.indexOf(element)] = updatedMaterial;
              tools.value = newList;
            }
          }
          toolsStatus.value = ToolStatus.success;
          SmartDialog.dismiss();
          showTools(context, id);
          notifyListeners();
        },
      );
    } catch (e) {
      toolsStatus.value = ToolStatus.failure;
      log('Server Error in section Get ticket Tools : $e');
    }
  }

  // ! Function Toggle Tool [ Selected , Not Selected ]
  Future<void> toggleTools(BuildContext context, String id, int ticketToolId, int index) async {
    try {
      _changeTools(index);
      toolsAddStatus.value = AddToolsStatus.loading;
      Map<String, dynamic> data = {"TicketId": int.tryParse(id), "ToolId": ticketToolId};
      final result = await ticketUsecase.addTools(CreateToolsParams.fromJson(data));
      result.fold(
        (l) {
          _changeTools(index);
          toolsAddStatus.value = AddToolsStatus.failure;
          SmartDialog.dismiss();
          SmartDialog.show(
            builder:
                (context) => WidgetDilog(
                  isError: true,
                  title: AppText(context).warning,
                  message: l.message,
                  cancelText: AppText(context).back,
                  onCancel: () => SmartDialog.dismiss(),
                ),
          );
        },
        (r) {
          if (selecteddTool.value.map((e) => e.id).toList().contains(tools.value[index].id)) {
            _deleteTools(tools.value[index]);
          } else {
            _addTools(tools.value[index]);
          }

          toolsAddStatus.value = AddToolsStatus.success;
        },
      );
    } catch (e) {
      SmartDialog.dismiss();
      toolsAddStatus.value = AddToolsStatus.failure;
      log('Server Error in section Get ticket details : $e');
    }
  }

  // ! Dialog For Select Tools
  void showTools(BuildContext context, String id) {
    String lang = context.read<LanguageProvider>().lang ?? 'en';

    SmartDialog.show(
      builder:
          (context) => WidgetDilog(
            title: AppText(context).requiredTools,
            message: '',
            contents: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.4,
                child: ValueListenableBuilder<List<TicketTool>>(
                  valueListenable: tools,
                  builder: (context, tool, _) {
                    return ListView.separated(
                      itemCount: tool.length,
                      separatorBuilder: (context, index) => const SizedBox(height: 5),
                      itemBuilder: (context, index) {
                        return CheckboxListTile(
                          contentPadding: EdgeInsets.zero,
                          dense: true,
                          value: tool[index].isSelect,
                          title: Text(lang == 'ar' ? tool[index].titleAr ?? '' : tool[index].title ?? '', style: AppTextStyle.style12B),
                          onChanged: (value) async {
                            await toggleTools(context, id, tool[index].id ?? 0, index);
                          },
                        );
                      },
                    );
                  },
                ),
              ),
            ],
            cancelText: AppText(context).back,
            onCancel: () => SmartDialog.dismiss(),
          ),
    );
  }

  _addTools(TicketTool tool) {
    final newList = selecteddTool.value;
    newList.add(tool);
    selecteddTool.value = newList;
    notifyListeners();
  }

  _deleteTools(TicketTool tool) {
    final newList = selecteddTool.value;
    newList.removeWhere((element) => element.id == tool.id);
    selecteddTool.value = newList;
    notifyListeners();
  }

  _changeTools(int index) {
    List<TicketTool> updatedTools = List.from(tools.value);
    updatedTools[index] = updatedTools[index].copyWith(isSelect: !updatedTools[index].isSelect);
    tools.value = updatedTools;
  }

  // * ============================== Materials ==============================

  // ! Function To Get Material
  Future<void> getMaterial(String id) async {
    try {
      SmartDialog.showLoading(msg: AppText(GlobalContext.context, isFunction: true).loading);
      materilsStatus.value = MaterilsStatus.loading;
      final result = await ticketUsecase.ticketMaterial(id);
      result.fold(
        (l) {
          materilsStatus.value = MaterilsStatus.failure;
          SmartDialog.dismiss();
          SmartDialog.show(
            builder:
                (context) => WidgetDilog(
                  isError: true,
                  title: AppText(context).warning,
                  message: l.message,
                  cancelText: AppText(context).back,
                  onCancel: () => SmartDialog.dismiss(),
                ),
          );
        },
        (r) {
          materials.value = r.data!;
          materilsStatus.value = MaterilsStatus.success;
          notifyListeners();
          SmartDialog.dismiss();
        },
      );
    } catch (e) {
      materilsStatus.value = MaterilsStatus.failure;
      SmartDialog.dismiss();
      log('Server Error in section Get ticket Material : $e');
    }
  }

  // ! Function To Add Material
  Future<void> addMaterial(BuildContext context, String id) async {
    try {
      List<Map<String, dynamic>> ticketTool = [];
      for (var i = 0; i < materials.value.length; i++) {
        if (materials.value[i].quantity != 0) {
          ticketTool.add({
            "MaterialId": materials.value[i].id,
            'Status': 'Pending',
            'Price': materials.value[0].price ?? 0,
            "Quantity": materials.value[i].quantity,
          });
        }
      }
      Map<String, dynamic> createMaterial = {'TicketId': int.tryParse(id), 'TicketMaterial': ticketTool};
      CreateMaterialParams createMaterialParams = CreateMaterialParams.fromJson(createMaterial);

      addMaterilsStatus.value = AddMaterilsStatus.loading;
      final result = await ticketUsecase.ticketAddMaterial(createMaterialParams);
      result.fold(
        (l) {
          addMaterilsStatus.value = AddMaterilsStatus.failure;

          SmartDialog.show(
            builder:
                (context) => WidgetDilog(
                  isError: true,
                  title: AppText(context).warning,
                  message: l.message,
                  cancelText: AppText(context).back,
                  onCancel: () => SmartDialog.dismiss(),
                ),
          );
        },
        (r) {
          selectedMaterial.value = materials.value.where((a) => a.quantity != 0).toList();
          addMaterilsStatus.value = AddMaterilsStatus.success;
          context.pop(true);
          notifyListeners();
        },
      );
    } catch (e) {
      addMaterilsStatus.value = AddMaterilsStatus.failure;
      log('Server Error in section Delete ticket Material : $e');
    }
  }

  // ! Function To Delete Material
  Future<void> deleteMaterial(int id) async {
    try {
      SmartDialog.showLoading(msg: AppText(GlobalContext.context, isFunction: true).loading);
      deleteMaterilsStatus.value = DeleteMaterilsStatus.loading;
      final result = await ticketUsecase.ticketDeleteMaterial(id);
      result.fold(
        (l) {
          deleteMaterilsStatus.value = DeleteMaterilsStatus.failure;
          SmartDialog.dismiss();
          SmartDialog.show(
            builder:
                (context) => WidgetDilog(
                  isError: true,
                  title: AppText(context).warning,
                  message: l.message,
                  cancelText: AppText(context).back,
                  onCancel: () => SmartDialog.dismiss(),
                ),
          );
        },
        (r) {
          selectedMaterial.value.removeWhere((value) => value.id == id);
          deleteMaterilsStatus.value = DeleteMaterilsStatus.success;
          SmartDialog.dismiss();
          notifyListeners();
        },
      );
    } catch (e) {
      deleteMaterilsStatus.value = DeleteMaterilsStatus.failure;
      SmartDialog.dismiss();
      log('Server Error in section Delete ticket Material : $e');
    }
  }

  // ! Counter For Materials
  void changeCounter({required int index, required num value}) {
    final currentList = materials.value;
    final updatedMaterial = currentList[index].copyWith(quantity: value.toInt());
    final newList = List<TicketMaterial>.from(currentList);
    newList[index] = updatedMaterial;
    materials.value = newList;
    notifyListeners();
  }

  // * ============================== Completion CheckList ==============================

  Future<void> getType() async {
    try {
      final result = await ticketUsecase.getType();
      result.fold(
        (l) {
          log('Server Error in section Get Type : ${l.message}');
        },
        (r) {
          types.value = r.data!;
          notifyListeners();
        },
      );
    } catch (e) {
      log('Server Error in section Get Type : $e');
    }
  }

  // ! Function To Get Maintenances
  Future<void> getMaintenances(String id) async {
    try {
      SmartDialog.showLoading(msg: AppText(GlobalContext.context, isFunction: true).loading);
      maintenancesStatusStatus.value = MaintenancesStatus.loading;
      final result = await ticketUsecase.getMaintenancesList(id);
      result.fold(
        (l) {
          maintenancesStatusStatus.value = MaintenancesStatus.failure;
          SmartDialog.dismiss();
          SmartDialog.show(
            builder:
                (context) => WidgetDilog(
                  isError: true,
                  title: AppText(context).warning,
                  message: l.message,
                  cancelText: AppText(context).back,
                  onCancel: () => SmartDialog.dismiss(),
                ),
          );
        },
        (r) {
          completionChecklist.value = r.data!;
          maintenancesStatusStatus.value = MaintenancesStatus.success;
          notifyListeners();
          SmartDialog.dismiss();
        },
      );
    } catch (e) {
      maintenancesStatusStatus.value = MaintenancesStatus.failure;
      SmartDialog.dismiss();
      log('Server Error in section Get ticket Material : $e');
    }
  }

  // ! Fuction To Update Maintenances

  Future<void> updateMaintenances(int ticketId, int mainId, {bool? isLevel1 = false, MaintenancesList? maintenancesList, bool? unSelected = false}) async {
    try {
      SmartDialog.showLoading(msg: AppText(GlobalContext.context, isFunction: true).loading);
      updateMaintenancesStatus.value = UpdateMaintenancesStatus.loading;
      Map<String, dynamic> maintenancParams = {
        'TicketId': ticketId,
        'MaintenanceId': mainId,
        'Note': note.text,
        'Images': images.value,
        "Score": isLevel1 == true ? 0 : rate.value,
        'Name': isLevel1 == true ? name.text : '',
        'ChoicesId':
            isLevel1 == false
                ? selectedtype.value.name == '' || selectedtype.value.name == null
                    ? '0'
                    : selectedtype.value.id.toString()
                : '0',
        'IsLevel1': isLevel1,
      };
      final result =
          unSelected == true
              ? await ticketUsecase.unSelectMaintenancesList(mainId, ticketId)
              : await ticketUsecase.updateMaintenancesList(MaintenancParams.fromJson(maintenancParams));
      result.fold(
        (l) {
          updateMaintenancesStatus.value = UpdateMaintenancesStatus.failure;
          SmartDialog.dismiss();
          SmartDialog.show(
            builder:
                (context) => WidgetDilog(
                  isError: true,
                  title: AppText(context).warning,
                  message: l.message,
                  cancelText: AppText(context).back,
                  onCancel: () => SmartDialog.dismiss(),
                ),
          );
        },
        (r) async {
          updateMaintenancesStatus.value = UpdateMaintenancesStatus.success;
          note.clear();
          imagesAttachment.value = [];
          images.value = [];
          selectedtype.value = const Choice();
          if (isLevel1 == false) {
            completionChecklist.value =
                completionChecklist.value.map((element) {
                  final updatedSubMaintenances =
                      element.subMaintenances?.map((sub) {
                        // ! Update subSubMaintenances
                        final updatedSubSubMaintenances =
                            sub.subSubMaintenances?.map((subSub) {
                              if (subSub.id == mainId) {
                                return subSub.copyWith(isChecked: unSelected == true ? false : true);
                              }
                              return subSub;
                            }).toList();
                        // ! Check if all subSubMaintenances are checked
                        final isSubMaintenanceChecked = updatedSubSubMaintenances?.every((s) => s.isChecked == true) ?? false;
                        return sub.copyWith(subSubMaintenances: updatedSubSubMaintenances, isChecked: isSubMaintenanceChecked);
                      }).toList();
                  // ! Check if all subMaintenances are checked
                  final isMaintenanceChecked = updatedSubMaintenances?.every((s) => s.isChecked == true) ?? false;
                  return element.copyWith(subMaintenances: updatedSubMaintenances, isChecked: isMaintenanceChecked);
                }).toList();
          }
          await getMaintenances(ticketId.toString());
          notifyListeners();
          SmartDialog.dismiss();
          SmartDialog.dismiss(result: true);
        },
      );
    } catch (e) {
      updateMaintenancesStatus.value = UpdateMaintenancesStatus.failure;
      SmartDialog.dismiss();
      log('Server Error in section Get ticket Material : $e');
    }
  }

  Future<void> pickMaintenanceImage({bool? isAdd = false, String? ticketId}) async {
    List<File> image = await pickMaltiImage(context: GlobalContext.context);
    if (image.isNotEmpty) {
      SmartDialog.showLoading(msg: AppText(GlobalContext.context, isFunction: true).loading);
      for (var element in image) {
        await uploadFile(image: element, ticketId: ticketId.toString(), isAdd: isAdd);
      }
      if (isAdd == true) {
        await addProviderAttachment(ticketId.toString(), imagesAttachment.value);
      }
    }
  }

  Future<void> pickMaintenanceImageFromCamera({bool? isAdd = false, String? ticketId}) async {
    List<File> image = [];

    List<MediaModel> mediaModels = await MultipleImageCamera.capture(context: GlobalContext.context);
    image = mediaModels.map((m) => m.file).toList();
    if (image.isNotEmpty) {
      SmartDialog.showLoading(msg: AppText(GlobalContext.context, isFunction: true).loading);
      for (var element in image) {
        await uploadFile(image: element, ticketId: ticketId.toString(), isAdd: isAdd);
      }
      if (isAdd == true) {
        await addProviderAttachment(ticketId.toString(), imagesAttachment.value);
      }
    }
  }

  _removeImage(int index) {
    if (imagesAttachment.value.isNotEmpty) {
      List<String> imagess = List.from(imagesAttachment.value);
      imagess.removeAt(index);
      imagesAttachment.value = imagess;
    }
    List<String> allImages = List.from(images.value);
    allImages.removeAt(index);
    images.value = allImages;
    notifyListeners();
  }

  void selectMethodForImage({bool? isAdd, String? ticketId}) {
    SmartDialog.show(
      builder:
          (context) => WidgetDilog(
            title: AppText(context, isFunction: true).uploadImages,
            message: '',
            contents: [
              ListTile(
                dense: true,
                contentPadding: EdgeInsets.zero,
                leading: Icon(Icons.image, color: AppColor.secondColor),
                title: Text(AppText(context, isFunction: true).uploadFromGallery, style: AppTextStyle.style14B),
                onTap: () {
                  SmartDialog.dismiss();
                  pickMaintenanceImage(isAdd: isAdd, ticketId: ticketId);
                },
              ),
              const Divider(),
              ListTile(
                dense: true,
                contentPadding: EdgeInsets.zero,
                leading: Icon(Icons.camera_alt, color: AppColor.secondColor),
                title: Text(AppText(context, isFunction: true).uploadFromCamera, style: AppTextStyle.style14B),
                onTap: () {
                  SmartDialog.dismiss();
                  pickMaintenanceImageFromCamera(isAdd: isAdd, ticketId: ticketId);
                },
              ),
            ],
            cancelText: AppText(context).back,
            onCancel: () {
              SmartDialog.dismiss();
            },
          ),
    );
  }

  final formKey = GlobalKey<FormState>();

  void uploadMaintenances(BuildContext context, int ticketId, int mainId, {MaintenancesList? maintenancesList, bool? isLevel1 = false}) {
    String lang = context.read<LanguageProvider>().lang ?? 'en';
    rate.value = 0;
    note.clear();
    images.value = [];
    selectedtype.value =
        (maintenancesList?.choices?.where((element) => element.isSelected == true).isNotEmpty ?? false)
            ? (maintenancesList?.choices?.where((element) => element.isSelected == true).toList().first ?? const Choice())
            : const Choice();
    ValueNotifier<String> hint = ValueNotifier(
      (maintenancesList?.choices?.where((element) => element.isSelected == true).isNotEmpty ?? false)
          ? (maintenancesList?.choices?.where((element) => element.isSelected == true).toList().first.name ?? '')
          : AppText(context, isFunction: true).selectType,
    );
    if (maintenancesList != null && isLevel1 == false) {
      rate.value = maintenancesList.score ?? 0;
      note.text = maintenancesList.noteValue ?? '';
      images.value = maintenancesList.images ?? [];
    }

    if (isLevel1 == true) {
      name.text = maintenancesList?.nameRoom ?? maintenancesList?.name ?? '';
      note.text = maintenancesList?.noteValue ?? '';
      images.value = maintenancesList?.images ?? [];
    }

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,

      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(16))),
      builder: (context) {
        return SafeArea(
          child: Padding(
            padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom, left: 16, right: 16, top: 20),
            child: Consumer<TicktesDetailsController>(
              builder: (context, controller, child) {
                return SingleChildScrollView(
                  child: Form(
                    key: controller.formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(AppText(context, isFunction: true).uploadMaintenance, style: AppTextStyle.style18B),
                        16.gap,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(AppText(context, isFunction: true).image, style: AppTextStyle.style14B),
                            AppButton.text(
                              text: AppText(context).uploud,
                              onPressed: () => selectMethodForImage(),
                              contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                              textStyle: AppTextStyle.style12B.copyWith(color: AppColor.white),
                            ),
                          ],
                        ),
                        10.gap,
                        ValueListenableBuilder(
                          valueListenable: images,
                          builder:
                              (context, allImage, child) => ListView.separated(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: allImage.length,
                                separatorBuilder: (context, index) => 5.gap,
                                itemBuilder: (context, index) => WidgetCompletionAttchment(url: allImage[index], onDelete: () => _removeImage(index)),
                              ),
                        ),
                        if (isLevel1 == true) ...[
                          10.gap,
                          Align(
                            alignment: lang == 'ar' ? Alignment.centerRight : Alignment.centerLeft,
                            child: Text(AppText(context, isFunction: true).name, style: AppTextStyle.style14B),
                          ),
                          5.gap,
                          WidgetTextField(AppText(context, isFunction: true).enterYourName, controller: name),
                        ] else ...[
                          10.gap,
                          Align(
                            alignment: lang == 'ar' ? Alignment.centerRight : Alignment.centerLeft,
                            child: Text(AppText(context, isFunction: true).type, style: AppTextStyle.style14B),
                          ),
                          5.gap,
                          ValueListenableBuilder(
                            valueListenable: selectedtype,
                            builder: (context, type, child) {
                              return ValueListenableBuilder(
                                valueListenable: hint,
                                builder:
                                    (context, data, child) => WidgetDropDown<Choice>(
                                      onTap:
                                          data != AppText(context, isFunction: true).selectType
                                              ? () {
                                                selectedtype.value = const Choice();
                                                hint.value = AppText(context, isFunction: true).selectType;
                                              }
                                              : type.name == '' || type.name == null
                                              ? null
                                              : () {
                                                selectedtype.value = const Choice();
                                                hint.value = AppText(context, isFunction: true).selectType;
                                              },
                                      value: type.name == '' || type.name == null ? null : type,
                                      hintText: data,
                                      itemLabel: (item) => item.name.toString(),
                                      styleHint: AppTextStyle.style14.copyWith(color: AppColor.black),
                                      items: maintenancesList?.choices ?? [],
                                      onChanged: (value) {
                                        selectedtype.value = value!;
                                      },
                                    ),
                              );
                            },
                          ),
                        ],
                        10.gap,
                        Align(
                          alignment: lang == 'ar' ? Alignment.centerRight : Alignment.centerLeft,
                          child: Text(AppText(context, isFunction: true).note, style: AppTextStyle.style14B),
                        ),
                        5.gap,
                        ValueListenableBuilder(
                          valueListenable: controller.rate,
                          builder:
                              (context, value, child) => WidgetTextField(
                                AppText(context, isFunction: true).enterYourNotes,
                                maxLines: 3,
                                controller: controller.note,
                                validator:
                                    value == 1
                                        ? (value) {
                                          if (selectedtype.value.name != '' && selectedtype.value.name != null) {
                                            return null;
                                          } else if (controller.note.text.isNotEmpty) {
                                            return null;
                                          } else {
                                            return AppText(context, isFunction: true).required;
                                          }
                                        }
                                        : null,
                              ),
                        ),
                        if (isLevel1 == false) ...[
                          10.gap,
                          ValueListenableBuilder(
                            valueListenable: controller.rate,
                            builder:
                                (context, value, child) => Row(
                                  spacing: 30,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    InkWell(
                                      onTap: () => controller.rate.value = 3,
                                      child: SvgPicture.asset(
                                        Assets.iconSmile,
                                        width: 45,
                                        color:
                                            value == 0
                                                ? AppColor.grey.withOpacity(0.5)
                                                : value == 3
                                                ? AppColor.primaryColor
                                                : AppColor.grey.withOpacity(0.5),
                                      ),
                                    ),

                                    InkWell(
                                      onTap: () => controller.rate.value = 2,
                                      child: SvgPicture.asset(
                                        Assets.iconGood,
                                        width: 45,
                                        color:
                                            value == 0
                                                ? AppColor.grey.withOpacity(0.5)
                                                : value == 2
                                                ? AppColor.grey
                                                : AppColor.grey.withOpacity(0.5),
                                      ),
                                    ),

                                    InkWell(
                                      onTap: () => controller.rate.value = 1,
                                      child: SvgPicture.asset(
                                        Assets.iconSadface,
                                        width: 45,
                                        color:
                                            value == 0
                                                ? AppColor.grey.withOpacity(0.5)
                                                : value == 1
                                                ? AppColor.red
                                                : AppColor.grey.withOpacity(0.5),
                                      ),
                                    ),
                                  ],
                                ),
                          ),
                        ],
                        20.gap,
                        Row(
                          children: [
                            Expanded(child: AppButton.text(text: AppText(context).back, onPressed: () => context.pop())),
                            const SizedBox(width: 10),
                            Expanded(
                              child: AppButton.text(
                                text: AppText(context).uploud,
                                onPressed: () async {
                                  if (formKey.currentState!.validate()) {
                                    if (controller.rate.value == 0 && isLevel1 == false) {
                                      SmartDialog.show(
                                        builder:
                                            (context) => WidgetDilog(
                                              isError: true,
                                              title: AppText(context).warning,
                                              message: AppText(context).mostBeSelectedRate,
                                              cancelText: AppText(context).back,
                                              onCancel: () {
                                                SmartDialog.dismiss();
                                              },
                                            ),
                                      );
                                    } else {
                                      if (controller.rate.value == 1 && images.value.isEmpty) {
                                        SmartDialog.show(
                                          builder:
                                              (context) => WidgetDilog(
                                                isError: true,
                                                title: AppText(context).warning,
                                                message: AppText(context).youMustBeSelectedImages,
                                                cancelText: AppText(context).back,
                                                onCancel: () {
                                                  SmartDialog.dismiss();
                                                },
                                              ),
                                        );
                                      } else {
                                        await controller.updateMaintenances(ticketId, mainId, isLevel1: isLevel1, maintenancesList: maintenancesList);
                                        context.pop();
                                      }
                                    }
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                        if (maintenancesList?.isChecked == true) ...[
                          10.gap,
                          Row(
                            children: [
                              Expanded(
                                child: AppButton.text(
                                  text: 'Unchecked',
                                  onPressed: () async => await controller.updateMaintenances(ticketId, mainId, isLevel1: isLevel1, unSelected: true),
                                  color: AppColor.red,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }
}
