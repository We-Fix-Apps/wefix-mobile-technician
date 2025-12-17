import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:hive/hive.dart';

import '../../../../core/constant/app_links.dart';
import '../../../../core/errors/dio_exp.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/services/api_services/api_client.dart';
import '../../../../core/services/api_services/dio_helper.dart';
import '../../../../core/services/api_services/result_model.dart';
import '../../../../core/services/hive_services/box_kes.dart';
import '../../../../injection_container.dart';
import '../model/home_model.dart';

abstract class HomeRepoistory {
  Future<Either<Failure, Result<HomeModel>>> getHomeData();
  Future<Either<Failure, Result<bool>>> checkUser();
}

class HomeRepoistoryImpl implements HomeRepoistory {
  @override
  Future<Either<Failure, Result<HomeModel>>> getHomeData() async {
    try {
      final ApiClient client = ApiClient(DioProvider().dio);
      final token = await sl<Box>(instanceName: BoxKeys.appBox).get(BoxKeys.usertoken);
      final homeResponse = await client.getRequest(endpoint: AppLinks.home, authorization: 'Bearer $token');
      HomeModel home = HomeModel.fromJson(homeResponse.response.data);
      return Right(Result.success(home));
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioError(e));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Result<bool>>> checkUser() async {
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
