import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/constant/app_links.dart';
import '../../../../core/errors/dio_exp.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/services/api_services/api_client.dart';
import '../../../../core/services/api_services/dio_helper.dart';
import '../../../../core/services/api_services/result_model.dart';
import '../model/job_application_params.dart';

abstract class RegisterRepository {
  Future<Either<Failure, Unit>> register(JobApplicationParams registerRequiestModel);
  Future<Either<Failure, Result<String>>> uploadFile(File voiceFile);
}

class RegisterRepositoryImpl implements RegisterRepository {
  @override
  Future<Either<Failure, Unit>> register(JobApplicationParams registerRequiestModel) async {
    try {
      final ApiClient client = ApiClient(DioProvider().dio);
      await client.postRequest(endpoint: AppLinks.register, body: registerRequiestModel.toJson());
      return const Right(unit);
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioError(e));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Result<String>>> uploadFile(File voiceFile) async {
    try {
      final ApiClient client = ApiClient(DioProvider().dio);
      final uploadFileResponse = await client.uploadFile(endpoint: AppLinks.uploadFile, file: voiceFile);
      return Right(Result.success(uploadFileResponse.response.data['link']));
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioError(e));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
}
