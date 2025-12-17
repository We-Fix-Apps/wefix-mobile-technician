import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

import '../../../../core/constant/app_links.dart';
import '../../../../core/context/global.dart';
import '../../../../core/errors/dio_exp.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/providers/language_provider/l10n_provider.dart';
import '../../../../core/services/api_services/api_client.dart';
import '../../../../core/services/api_services/dio_helper.dart';
import '../../../../core/services/api_services/result_model.dart';
import '../../../../core/services/hive_services/box_kes.dart';
import '../../../../injection_container.dart';
import '../model/contact_info_model.dart';
import '../model/user_model.dart';

abstract class LoginRepository {
  Future<Either<Failure, Result<Map>>> login(String mobile);
  Future<Either<Failure, Result<UserModel>>> checkOTPCode(String mobile, String code, String fcm);
  Future<Either<Failure, Result<ContactInfoModel>>> getContactInfo();
}

class LoginRepositoryImpl implements LoginRepository {
  @override
  Future<Either<Failure, Result<Map>>> login(String mobile) async {
    try {
      String lang = GlobalContext.context.read<LanguageProvider>().lang ?? 'en';
      String tokenFCM = sl<Box>(instanceName: BoxKeys.appBox).get(BoxKeys.fcmtoken, defaultValue: '');
      final ApiClient client = ApiClient(DioProvider().dio);
      final loginResponse = await client.postRequest(endpoint: AppLinks.login, body: {"Mobile": mobile, "ActivationCode": tokenFCM});
      if (loginResponse.response.statusCode == 200) {
        if (loginResponse.response.data['status']) {
          return Right(Result.success(loginResponse.response.data));
        } else {
          return Left(ServerFailure(message: lang == 'ar' ? loginResponse.response.data['messageAr'] : loginResponse.response.data['message']));
        }
      } else {
        return Left(ServerFailure.fromResponse(loginResponse.response.statusCode));
      }
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioError(e));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Result<UserModel>>> checkOTPCode(String mobile, String code, String fcm) async {
    try {
      String lang = GlobalContext.context.read<LanguageProvider>().lang ?? 'en';
      final ApiClient client = ApiClient(DioProvider().dio);
      final sendOtpResponse = await client.postRequest(
        endpoint: AppLinks.sendOTP,
        body: {"Mobile": mobile.replaceAll(' ', '+'), "otp": code, 'ActivationCode': fcm},
      );
      if (sendOtpResponse.response.statusCode == 200) {
        if (sendOtpResponse.response.data['status']) {
          UserModel userModel = UserModel.fromJson(sendOtpResponse.response.data);
          return Right(Result.success(userModel));
        } else {
          return Left(ServerFailure(message: lang == 'ar' ? sendOtpResponse.response.data['messageAr'] : sendOtpResponse.response.data['message']));
        }
      } else {
        return Left(ServerFailure.fromResponse(sendOtpResponse.response.statusCode));
      }
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioError(e));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Result<ContactInfoModel>>> getContactInfo() async {
    try {
      final ApiClient client = ApiClient(DioProvider().dio);
      final response = await client.getRequest(endpoint: AppLinks.contactInfo);
      if (response.response.statusCode == 200) {
        ContactInfoModel contactInfoModel = ContactInfoModel.fromJson(response.response.data);
        return Right(Result.success(contactInfoModel));
      } else {
        return Left(ServerFailure.fromResponse(response.response.statusCode));
      }
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioError(e));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
}
