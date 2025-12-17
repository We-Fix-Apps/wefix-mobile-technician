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
import '../model/maintenances_list_model.dart';
import '../model/params/maintenanc_params.dart';

abstract class MaintenancesRepoistory {
  Future<Either<Failure, Result<List<MaintenancesList>>>> getMaintenancesList(String ticketId);
  Future<Either<Failure, Result<Unit>>> updateMaintenancesList(MaintenancParams params);
  Future<Either<Failure, Result<Unit>>> unSelectMaintenancesList(int id, int ticketId);
  Future<Either<Failure, Result<List<dynamic>>>> getType();
}

class MaintenancesRepoistoryImpl implements MaintenancesRepoistory {
  @override
  Future<Either<Failure, Result<List<MaintenancesList>>>> getMaintenancesList(String ticketId) async {
    try {
      final ApiClient client = ApiClient(DioProvider().dio);
      final token = await sl<Box>(instanceName: BoxKeys.appBox).get(BoxKeys.usertoken);
      final ticketMaintenancesResponse = await client.getRequest(endpoint: AppLinks.ticketsMaintenances + ticketId, authorization: 'Bearer $token');
      MaintenancesListModel ticketMaintenances = MaintenancesListModel.fromJson(ticketMaintenancesResponse.response.data);
      return Right(Result.success(ticketMaintenances.maintenancesList));
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioError(e));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Result<Unit>>> updateMaintenancesList(MaintenancParams params) async {
    try {
      final ApiClient client = ApiClient(DioProvider().dio);
      final token = await sl<Box>(instanceName: BoxKeys.appBox).get(BoxKeys.usertoken);
      final ticketAddMaintenanceslResponse = await client.postRequest(
        endpoint: AppLinks.ticketsCreateMaintenances,
        body: params.toJson(),
        authorization: 'Bearer $token',
      );
      if (ticketAddMaintenanceslResponse.response.data['status'] == false) {
        return Left(
          ServerFailure.fromResponse(ticketAddMaintenanceslResponse.response.statusCode, message: ticketAddMaintenanceslResponse.response.data['message']),
        );
      }
      return Right(Result.success(unit));
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioError(e));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Result<Unit>>> unSelectMaintenancesList(int id, int ticketId) async {
    try {
      final ApiClient client = ApiClient(DioProvider().dio);
      final token = await sl<Box>(instanceName: BoxKeys.appBox).get(BoxKeys.usertoken);
      final ticketAddMaintenanceslResponse = await client.postRequest(
        endpoint: AppLinks.unSelectMaintenances,
        body: {"MaintenanceId": id, 'TicketId': ticketId},
        authorization: 'Bearer $token',
      );
      if (ticketAddMaintenanceslResponse.response.data['status'] == false) {
        return Left(
          ServerFailure.fromResponse(ticketAddMaintenanceslResponse.response.statusCode, message: ticketAddMaintenanceslResponse.response.data['message']),
        );
      }
      return Right(Result.success(unit));
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioError(e));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Result<List<dynamic>>>> getType() async {
    try {
      final ApiClient client = ApiClient(DioProvider().dio);
      final token = await sl<Box>(instanceName: BoxKeys.appBox).get(BoxKeys.usertoken);
      final result = await client.getRequest(endpoint: AppLinks.type, authorization: 'Bearer $token');
      if (result.response.data['status'] == false) {
        return Left(ServerFailure.fromResponse(result.response.statusCode, message: result.response.data['message']));
      }
      return Right(Result.success(result.response.data['type']));
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioError(e));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
}
