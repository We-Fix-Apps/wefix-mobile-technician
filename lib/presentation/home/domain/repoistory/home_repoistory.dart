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
      // Use SERVER_TMMS for home endpoint (backend-tmms)
      // Backend-tmms route convention: /api/v1/tickets/home
      final ApiClient client = ApiClient(DioProvider().dio, baseUrl: AppLinks.serverTMMS);
      final token = await sl<Box>(instanceName: BoxKeys.appBox).get(BoxKeys.usertoken);
      final homeResponse = await client.getRequest(endpoint: 'tickets/home', authorization: 'Bearer $token');
      
      // Handle both direct data and wrapped response formats
      final responseData = homeResponse.response.data;
      final data = responseData['data'] ?? responseData;
      
      HomeModel home = HomeModel.fromJson(data);
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
      // Use SERVER_TMMS for check access endpoint (backend-tmms)
      final token = await sl<Box>(instanceName: BoxKeys.appBox).get(BoxKeys.usertoken);
      final ApiClient client = ApiClient(DioProvider().dio, baseUrl: AppLinks.serverTMMS);
      // Backend-tmms route: GET /api/v1/user/me (check user role)
      final response = await client.getRequest(endpoint: 'user/me', authorization: 'Bearer $token');
      if (response.response.statusCode == 200) {
        // Check if user has valid role (Technician 21 or Sub-Technician 22)
        final userData = response.response.data['data'] ?? response.response.data['user'] ?? response.response.data;
        final userRoleId = userData['userRoleId'] as int?;
        if (userRoleId == 21 || userRoleId == 22) {
          return Right(Result.success(true));
        } else {
          return Right(Result.success(false));
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
