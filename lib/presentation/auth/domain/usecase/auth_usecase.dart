import 'dart:io';

import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/services/api_services/result_model.dart';
import '../model/contact_info_model.dart';
import '../model/job_application_params.dart';
import '../model/user_model.dart';
import '../repoistory/login_repository.dart';
import '../repoistory/register_repository.dart';

class AuthUsecase {
  final LoginRepository loginRepository;
  final RegisterRepository registerRepository;
  AuthUsecase({required this.loginRepository, required this.registerRepository});

  Future<Either<Failure, Result<Map>>> login({required String mobile}) async => await loginRepository.login(mobile);
  Future<Either<Failure, Result<UserModel>>> sendOtp({required String mobile, required String otp, required String fcm}) async =>
      await loginRepository.checkOTPCode(mobile, otp, fcm);
  Future<Either<Failure, Unit>> register(JobApplicationParams registerRequiestModel) async => await registerRepository.register(registerRequiestModel);
  Future<Either<Failure, Result<String>>> uploadFile(File voiceFile) async => await registerRepository.uploadFile(voiceFile);
  Future<Either<Failure, Result<ContactInfoModel>>> getContactInfo() async => await loginRepository.getContactInfo();
}
