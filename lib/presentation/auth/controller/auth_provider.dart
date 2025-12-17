import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:local_auth/local_auth.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:record/record.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:file_picker/file_picker.dart';

import '../../../core/context/global.dart';
import '../../../core/extension/gap.dart';
import '../../../core/providers/app_text.dart';
import '../../../core/router/router_key.dart';
import '../../../core/services/hive_services/box_kes.dart';
import '../../../core/unit/app_color.dart';
import '../../../core/unit/app_text_style.dart';
import '../../../core/widget/widget_daialog.dart';
import '../../../injection_container.dart';
import '../domain/auth_enum.dart';
import '../domain/model/contact_info_model.dart';
import '../domain/model/job_application_params.dart';
import '../domain/model/user_model.dart';
import '../domain/usecase/auth_usecase.dart';

class AuthProvider extends ChangeNotifier with WidgetsBindingObserver {
  final AuthUsecase authUsecase;

  bool isRegister = false;

  // Auth  Variables
  final key = GlobalKey<FormState>();
  final keyRegister = GlobalKey<FormState>();
  final otpKey = GlobalKey<FormState>();
  final ValueNotifier<LoginState> loginState = ValueNotifier(LoginState.init);
  final ValueNotifier<SendState> sendOTPState = ValueNotifier(SendState.init);
  final ValueNotifier<UploadFileState> uploadState = ValueNotifier(UploadFileState.init);
  TextEditingController mobile = TextEditingController();
  TextEditingController digitCode = TextEditingController();
  TextEditingController otp = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController profession = TextEditingController();
  TextEditingController age = TextEditingController();
  TextEditingController intro = TextEditingController();
  TextEditingController cv = TextEditingController();

  final LocalAuthentication authFingerPrint = LocalAuthentication();
  bool isSupport = false;
  bool isFaceIdEnabled = false;
  final ImagePicker _picker = ImagePicker();
  File? imagePath;
  String? image;
  File? filePath;
  Timer? timer;
  Map audioRecord = {'path': '', 'duration': 0, 'stop': false};
  String? audio;
  int duration = 0;
  final record = AudioRecorder();
  bool isRecording = false;

  AuthProvider({required this.authUsecase}) {
    Future.wait([isBiometricAuthAvailable(), getContactInfo(), checkBiometrics()]);
  }

  final ValueNotifier<ContactInfoModel> contractInfo = ValueNotifier(const ContactInfoModel());

  Future<void> getContactInfo() async {
    try {
      final contactInfoResponse = await authUsecase.getContactInfo();
      contactInfoResponse.fold(
        (l) {
          log('Error fetching contact info: ${l.message}');
        },
        (r) {
          contractInfo.value = r.data!;
          log('Contact info fetched successfully: ${r.data}');
        },
      );
    } catch (e) {
      log('Exception while fetching contact info: $e');
    }
  }

  // Enter Mobile Number Method
  void enterPhoneNumber(PhoneNumber phoneNumber) {
    mobile.text = phoneNumber.phoneNumber ?? '';
    notifyListeners();
  }

  // Function to change the authentication type
  void toggleAuth() {
    isRegister = !isRegister;
    notifyListeners();
  }

  // Support Show Dialogs
  void supportDailg(BuildContext context) {
    SmartDialog.show(
      builder:
          (context) => WidgetDilog(
            title: AppText(context).support,
            message: '',
            isSupport: true,
            contents: [
              Text(AppText(context).pleasecontactthedirectengineerorphonenumber, textAlign: TextAlign.center, style: AppTextStyle.style14),
              5.gap,
              Center(
                child: InkWell(
                  onTap: () async {
                    const url = 'tel:00962780000000';
                    final uri = Uri.parse(url);
                    await launchUrl(uri);
                  },
                  child: Text('+962780000000', style: AppTextStyle.style14B.copyWith(color: AppColor.primaryColor)),
                ),
              ),
            ],
            cancelText: AppText(context).cancel,
            onCancel: () {
              SmartDialog.dismiss();
            },
          ),
    );
  }

  // Start Recording Function
  Future<void> startRecording() async {
    final micStatus = await Permission.microphone.request();

    if (micStatus.isGranted) {
      try {
        final dir = await getApplicationDocumentsDirectory();
        final path = "${dir.path}/audio_${DateTime.now().millisecondsSinceEpoch}.m4a";

        await record.start(const RecordConfig(), path: path);
        audioRecord['path'] = path.split('/').last;
        isRecording = true;
        _startTimer();
        notifyListeners();
      } catch (e) {
        log("Error starting recording: $e");
      }
    } else if (micStatus.isPermanentlyDenied) {
      log("Microphone permission is permanently denied. Redirecting to settings...");
      await openAppSettings();
    } else {
      log("Microphone permission was denied.");
    }
  }

  Future<void> stopRecording() async {
    try {
      await record.stop();
    } catch (e) {
      log("Error stopping recording: $e");
    } finally {
      isRecording = false;
      duration = 0;
      audioRecord['duration'] = duration;
      audioRecord['stop'] = true;
      _stopTimer();
      uploadFile(UploadFileType.voice);
      notifyListeners();
    }
  }

  void _startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      duration = duration + 1;
      notifyListeners();
    });
  }

  void _stopTimer() {
    timer?.cancel();
    timer = null;
  }

  void clearAudioRecord() {
    audioRecord = {'path': '', 'duration': 0, 'stop': false};
    notifyListeners();
  }

  // Social Media Links Function
  void launchSocial(String link) async {
    final url = Uri.parse(link);
    await launchUrl(url);
  }

  // Login Function
  Future<void> login() async {
    if (key.currentState!.validate()) {
      try {
        loginState.value = LoginState.loading;
        final loginRequiest = await authUsecase.login(mobile: mobile.text);
        loginRequiest.fold(
          (l) {
            loginState.value = LoginState.failure;
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
            loginState.value = LoginState.success;
            return GlobalContext.context.push('${RouterKey.login + RouterKey.otp}?mobile=${mobile.text}');
          },
        );
      } catch (e) {
        loginState.value = LoginState.failure;
        log('Server Error In Login Section : $e');
      }
    }
  }

  // Register Functions
  Future<void> pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      imagePath = File(pickedFile.path);
      await uploadFile(UploadFileType.image);
    }
    notifyListeners();
  }

  Future<void> pickFile() async {
    final result = await FilePicker.platform.pickFiles();
    if (result != null && result.files.single.path != null) {
      filePath = File(result.files.single.path!);
      await uploadFile(UploadFileType.cv);
    }
    notifyListeners();
  }

  Future<void> uploadFile(UploadFileType fileType) async {
    try {
      final dir = await getApplicationDocumentsDirectory();
      File? fileToUpload;

      switch (fileType) {
        case UploadFileType.image:
          if (imagePath != null) fileToUpload = imagePath;
          break;
        case UploadFileType.voice:
          final voiceFilePath = audioRecord['path'];
          if (voiceFilePath != null) fileToUpload = File('${dir.path}/$voiceFilePath');
          break;
        case UploadFileType.cv:
          if (filePath != null) fileToUpload = filePath;
          break;
      }

      if (fileToUpload == null) {
        throw Exception('No valid file found to upload.');
      }

      final result = await authUsecase.uploadFile(fileToUpload);

      result.fold(
        (failure) {
          uploadState.value = UploadFileState.failure;
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
        (success) {
          uploadState.value = UploadFileState.success;

          switch (fileType) {
            case UploadFileType.image:
              image = success.data!;
              log('Uploaded image: $image');
              break;
            case UploadFileType.voice:
              audio = success.data!;
              log('Uploaded audio: $audio');
              break;
            case UploadFileType.cv:
              cv.text = success.data!;
              log('Uploaded CV: ${cv.text}');
              break;
          }

          notifyListeners();
        },
      );
    } catch (e, stack) {
      uploadState.value = UploadFileState.failure;
      log('Upload error: $e\n$stack');
    }
  }

  Future<void> register() async {
    if (keyRegister.currentState!.validate()) {
      try {
        loginState.value = LoginState.loading;
        Map<String, dynamic> userData = {
          'Name': name.text,
          'Email': email.text,
          'Mobile': digitCode.text + mobile.text,
          'Address': address.text,
          'Profession': profession.text,
          'Age': age.text,
          'About': intro.text,
          'Cv': cv.text,
          'Image': image,
          'AboutVoice': audio,
        };
        final resultRegister = await authUsecase.register(JobApplicationParams.fromJson(userData));
        resultRegister.fold(
          (failure) {
            loginState.value = LoginState.failure;
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
          (sucess) {
            loginState.value = LoginState.failure;
            _clear();
            SmartDialog.show(
              builder:
                  (context) => WidgetDilog(
                    title: AppText(context).successfully,
                    message: AppText(context).youraccountiscurrentlyunderreviewWewillnotifyyouonceithabeenapprovedThankyoufoyourpatience,
                    cancelText: AppText(context).back,
                    onCancel: () => SmartDialog.dismiss(),
                  ),
            );
          },
        );
      } catch (e) {
        log('Server Error In Register Section : $e');
      }
    }
  }

  void modifyMobileNumber(String phone, String code) {
    mobile.text = phone;
    digitCode.text = code;
    notifyListeners();
  }

  _clear() {
    name.clear();
    email.clear();
    mobile.clear();
    address.clear();
    profession.clear();
    age.clear();
    intro.clear();
    cv.clear();
    image = null;
    audio = null;
    imagePath = null;
    filePath = null;
    audioRecord = {'path': '', 'duration': 0, 'stop': false};
    notifyListeners();
  }

  changeCV() {
    cv.clear();
    notifyListeners();
  }

  // OTP Function
  Future<void> sendOTP(String phone) async {
    if (otpKey.currentState!.validate()) {
      try {
        sendOTPState.value = SendState.loading;
        String? fcmToken = sl<Box>(instanceName: BoxKeys.appBox).get(BoxKeys.fcmtoken);
        final sendOtpResponse = await authUsecase.sendOtp(mobile: phone, otp: otp.text, fcm: fcmToken ?? '');
        sendOtpResponse.fold(
          (l) {
            sendOTPState.value = SendState.failure;
            return SmartDialog.show(
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
            sl<Box>(instanceName: BoxKeys.appBox).put(BoxKeys.enableAuth, true);
            sl<Box>(instanceName: BoxKeys.appBox).put(BoxKeys.usertoken, r.data?.token);
            sl<Box<User>>().put(BoxKeys.userData, r.data!.user!);
            sendOTPState.value = SendState.success;
            return GlobalContext.context.push(RouterKey.layout);
          },
        );
      } catch (e) {
        sendOTPState.value = SendState.failure;
        log('Server Error In Send OTP Section : $e');
      }
    }
  }

  Future<void> resendOTP(String phone) async {
    try {
      SmartDialog.showLoading(
        msg: AppText(GlobalContext.context, isFunction: true).loading,
        maskColor: Colors.black.withOpacity(0.5),
        backDismiss: false,
        builder: (context) {
          return CircularProgressIndicator(
            valueColor: const AlwaysStoppedAnimation<Color>(AppColor.white),
            backgroundColor: AppColor.primaryColor.withOpacity(0.8),
          );
        },
      );
      final loginRequiest = await authUsecase.login(mobile: phone.replaceAll(' ', '+'));
      loginRequiest.fold(
        (l) {
          SmartDialog.dismiss();
          return SmartDialog.show(
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
          return SmartDialog.show(
            builder:
                (context) => WidgetDilog(
                  title: AppText(context).successfully,
                  message: AppText(context).verifycodehasbeenresentcheckyourinbox,
                  cancelText: AppText(context).back,
                  onCancel: () => SmartDialog.dismiss(),
                ),
          );
        },
      );
    } catch (e) {
      SmartDialog.dismiss();
      log('Server Error In Resrnd OTP Section : $e');
    }
  }

  // Biometrics Functions
  Future<void> isBiometricAuthAvailable() async {
    final localAuth = LocalAuthentication();
    bool isAvailable = await localAuth.canCheckBiometrics;
    isSupport = isAvailable;
  }

  Future<void> checkBiometrics() async {
    bool canCheckBiometrics = await authFingerPrint.canCheckBiometrics;
    if (canCheckBiometrics) {
      List<BiometricType> availableBiometrics = await authFingerPrint.getAvailableBiometrics();
      isFaceIdEnabled =
          availableBiometrics.contains(BiometricType.weak) ||
          availableBiometrics.contains(BiometricType.face) ||
          availableBiometrics.contains(BiometricType.fingerprint);
    }
  }

  Future<void> authenticate(BuildContext context) async {
    bool authenticated = false;
    try {
      SmartDialog.showLoading(
        msg: AppText(context, isFunction: true).loading,
        maskColor: Colors.black.withOpacity(0.5),
        backDismiss: false,
        builder: (context) {
          return CircularProgressIndicator(
            valueColor: const AlwaysStoppedAnimation<Color>(AppColor.white),
            backgroundColor: AppColor.primaryColor.withOpacity(0.8),
          );
        },
      );
      authenticated = await LocalAuthentication().authenticate(
        localizedReason: "Scan yore finger to authentecate",
        options: const AuthenticationOptions(biometricOnly: true, stickyAuth: false),
      );

      if (authenticated) {
        sl<Box>(instanceName: BoxKeys.appBox).put(BoxKeys.enableAuth, true);
        SmartDialog.dismiss();
        context.go(RouterKey.layout);
      } else {
        SmartDialog.dismiss();
      }
    } on PlatformException catch (e) {
      SmartDialog.dismiss();
      log(e.toString());
    }
  }

  @override
  void dispose() {
    mobile.dispose();
    otp.dispose();
    super.dispose();
  }
}
