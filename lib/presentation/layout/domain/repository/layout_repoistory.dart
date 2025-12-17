import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../../core/constant/app_links.dart';
import '../../../../core/errors/dio_exp.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/services/api_services/api_client.dart';
import '../../../../core/services/api_services/dio_helper.dart';
import '../../../../core/services/api_services/result_model.dart';
import '../../../../core/services/hive_services/box_kes.dart';
import '../../../../injection_container.dart';
import '../../../auth/domain/model/user_model.dart';

abstract class LayoutRepoistory {
  Future<Either<Failure, Result<User>>> getProfile();
  Future<Either<Failure, Result<bool>>> checkAccess();
}

class LayoutRepoistoryImpl implements LayoutRepoistory {
  @override
  Future<Either<Failure, Result<User>>> getProfile() async {
    try {
      final token = await sl<Box>(instanceName: BoxKeys.appBox).get(BoxKeys.usertoken);
      final ApiClient client = ApiClient(DioProvider().dio);
      final response = await client.getRequest(endpoint: AppLinks.profile, authorization: 'Bearer $token');
      if (response.response.statusCode == 200) {
        User userModel = User.fromJson(response.response.data['serviceProvider']);
        return Right(Result.success(userModel));
      } else {
        return Left(ServerFailure.fromResponse(response.response.statusCode));
      }
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioError(e));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Result<bool>>> checkAccess() async {
    try {
      final token = await sl<Box>(instanceName: BoxKeys.appBox).get(BoxKeys.usertoken);
      final ApiClient client = ApiClient(DioProvider().dio);
      final response = await client.getRequest(endpoint: AppLinks.checkAccess, authorization: 'Bearer $token');
      if (response.response.statusCode == 200) {
        if (!response.response.data['status']) {
          return Right(Result.success(false));
        } else {
          return Right(Result.success(true));
        }
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
