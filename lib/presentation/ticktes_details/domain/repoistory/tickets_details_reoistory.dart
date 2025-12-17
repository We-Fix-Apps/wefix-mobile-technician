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
import '../model/tickets_details_model.dart';

abstract class TicketsDetailsReoistory {
  Future<Either<Failure, Result<TicketsDetails>>> ticketDetails(String ticketId);
  Future<Either<Failure, Result<Unit>>> startTickets(String ticketId);
  Future<Either<Failure, Result<Unit>>> createTicketImage(String ticketId, List<String> images);
  Future<Either<Failure, Result<Unit>>> completeTicket(String ticketId, String note, String signature, String link);
}

class TicketsDetailsReoistoryImpl implements TicketsDetailsReoistory {
  @override
  Future<Either<Failure, Result<TicketsDetails>>> ticketDetails(String ticketId) async {
    try {
      final ApiClient client = ApiClient(DioProvider().dio);
      final token = await sl<Box>(instanceName: BoxKeys.appBox).get(BoxKeys.usertoken);
      final ticketDetailsResponse = await client.getRequest(endpoint: AppLinks.tickets + ticketId, authorization: 'Bearer $token');
      TicketsDetailsModel ticketDetails = TicketsDetailsModel.fromJson(ticketDetailsResponse.response.data);
      return Right(Result.success(ticketDetails.ticketsDetails));
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioError(e));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Result<Unit>>> startTickets(String ticketId) async {
    try {
      final ApiClient client = ApiClient(DioProvider().dio);
      final token = await sl<Box>(instanceName: BoxKeys.appBox).get(BoxKeys.usertoken);
      await client.postRequest(endpoint: AppLinks.startTickets, body: {'Id': ticketId}, authorization: 'Bearer $token');
      return Right(Result.success(unit));
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioError(e));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Result<Unit>>> completeTicket(String ticketId, String note, String signature, String link) async {
    try {
      final ApiClient client = ApiClient(DioProvider().dio);
      final token = await sl<Box>(instanceName: BoxKeys.appBox).get(BoxKeys.usertoken);
      await client.postRequest(
        endpoint: AppLinks.completeTickets,
        body: {'Id': ticketId, 'SpNote': note, 'Signature': signature, 'VideoLink': link},
        authorization: 'Bearer $token',
      );
      return Right(Result.success(unit));
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioError(e));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Result<Unit>>> createTicketImage(String ticketId, List<String> images) async {
    try {
      final ApiClient client = ApiClient(DioProvider().dio);
      final token = await sl<Box>(instanceName: BoxKeys.appBox).get(BoxKeys.usertoken);
      await client.postRequest(endpoint: AppLinks.createTicketImage, body: {'TicketId': ticketId, 'Images': images}, authorization: 'Bearer $token');
      return Right(Result.success(unit));
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioError(e));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
}
