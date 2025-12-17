import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:record/record.dart';
import 'package:signalr_netcore/hub_connection.dart';
import 'package:signalr_netcore/hub_connection_builder.dart';

import '../../../core/constant/app_links.dart';
import '../../../core/context/global.dart';
import '../../../core/providers/app_text.dart';
import '../../../core/unit/app_color.dart';
import '../../../core/unit/app_text_style.dart';
import '../../../core/widget/widget_daialog.dart';
import '../../auth/domain/usecase/auth_usecase.dart';
import '../domain/model/chat_message_model.dart';
import '../domain/model/chat_params.dart';
import '../domain/usecase/chat_usecase.dart';

class ChatController extends ChangeNotifier with WidgetsBindingObserver {
  final ChatUsecase ticketUsecase;
  final AuthUsecase authUsecase;

  final ImagePicker _picker = ImagePicker();
  File? imagePath;
  String? imageLink;
  String audioPath = '';
  final record = AudioRecorder();
  HubConnection? _hubConnection;
  List<Message> messages = [];

  TextEditingController messageController = TextEditingController();

  ChatController({required this.ticketUsecase, required this.authUsecase});

  // * Function to pick an image from the gallery
  Future<void> pickImage(int ticketId, int toUserId, {bool? isCamera}) async {
    SmartDialog.showLoading(msg: AppText(GlobalContext.context, isFunction: true).loading);
    final pickedFile = await _picker.pickImage(source: isCamera == true ? ImageSource.camera : ImageSource.gallery);
    if (pickedFile != null) {
      imagePath = File(pickedFile.path);
      await uploadFile(ticketId, toUserId);
    } else {
      SmartDialog.dismiss();
    }
  }

  void selectMethodForImage(int ticketId, int toUserId) {
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
                  pickImage(ticketId, toUserId);
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
                  pickImage(ticketId, toUserId, isCamera: true);
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

  Future<void> uploadFile(int ticketId, int toUserId) async {
    try {
      final result = await authUsecase.uploadFile(imagePath!);
      result.fold(
        (failure) {
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
          imageLink = success.data;
          notifyListeners();
          SmartDialog.dismiss();
          await sendMessages(ticketId, toUserId);
        },
      );
    } catch (e, stack) {
      SmartDialog.dismiss();
      log('Upload error: $e\n$stack');
    }
  }

  // * Function to Record Audio
  Future<void> startRecording() async {
    final micStatus = await Permission.microphone.request();
    final storageStatus = await Permission.storage.request();
    if (micStatus.isGranted && storageStatus.isGranted) {
      final dir = await getApplicationDocumentsDirectory();
      final path = "${dir.path}/audio_${DateTime.now().millisecondsSinceEpoch}.m4a";

      await record.start(const RecordConfig(), path: path);
      audioPath = path;
    } else {
      debugPrint("Permissions not granted.");
    }
  }

  // * Function toGet All Messages
  Future<void> getAllMessages(int ticketId) async {
    try {
      SmartDialog.showLoading(msg: AppText(GlobalContext.context, isFunction: true).loading);
      final result = await ticketUsecase.getMessages(ticketId);
      result.fold(
        (l) {
          SmartDialog.dismiss();
          log('Server Error in section Get ticket details : ${l.message}');
        },
        (r) {
          messages = r.data!;
          SmartDialog.dismiss();
          notifyListeners();
          log('Messages fetched successfully: ${r.data}');
        },
      );
    } catch (e) {
      SmartDialog.dismiss();
      log('Server Error in section Get ticket details : $e');
    }
  }

  // * Function to Send Messages
  Future<void> sendMessages(int ticketId, int toUserId) async {
    try {
      SmartDialog.showLoading(msg: AppText(GlobalContext.context, isFunction: true).loading);
      final result = await ticketUsecase.sendMessage(
        ChatParams.fromJson({'ToUserId': toUserId, 'TicketId': ticketId, 'message': messageController.text, 'image': imageLink == '' ? '' : imageLink}),
      );
      result.fold(
        (l) {
          SmartDialog.dismiss();
          log('Server Error in section Get ticket details : ${l.message}');
        },
        (r) {
          messageController.clear();
          imageLink = null;
          notifyListeners();
          SmartDialog.dismiss();
        },
      );
    } catch (e) {
      SmartDialog.dismiss();
      log('Server Error in section Get ticket details : $e');
    }
  }

  // * Connect To Channel

  Future<void> connect(int ticketId, int toUserId) async {
    _hubConnection = HubConnectionBuilder().withUrl(AppLinks.chatChannel).build();
    _hubConnection!.onclose(({error}) async {
      log('❌ Connection closed: $error');
      await connect(ticketId, toUserId);
      _hubConnection = null;
    });

    _hubConnection?.on('ReceiveMessage', (resultData) {
      log('📥 Received: $resultData');
      if (resultData == null || resultData.isEmpty) return;
      if (resultData[0] is Map<String, dynamic>) {
        try {
          Map<String, dynamic> data = resultData[0] as Map<String, dynamic>;
          List<Message> newList = List.from(messages);
          Message newMessage = Message.fromJson({
            "message": data["message"],
            "image": data["image"],
            "fromUserId": data["fromUserId"],
            "ticketId": data["ticketId"],
          });
          newList.add(newMessage);
          messages = newList;
          log('📥 New message added: ${messages.last.message}');
          notifyListeners();
        } catch (e) {
          log('❌ Error parsing message: $e');
        }
      }
    });
    try {
      await _hubConnection?.start();

      log('✅ Connected with connection_id: ${_hubConnection?.connectionId}');
      await _hubConnection?.invoke('JoinTicket', args: [ticketId, toUserId]);
    } catch (e) {
      log('❌ Error: $e');
    }
  }

  Future<void> disconnect() async {
    await _hubConnection?.stop();
    _hubConnection = null;
    log('❌ Connection closed');
  }

  @override
  void dispose() {
    disconnect();
    super.dispose();
  }
}
