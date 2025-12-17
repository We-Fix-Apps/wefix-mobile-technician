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
import '../model/params/create_tools_params.dart';
import '../model/tickets_details_model.dart';
import '../model/tools_model.dart';

abstract class ToolsReoistory {
  Future<Either<Failure, Result<List<TicketTool>>>> ticketTools();
  Future<Either<Failure, Result<Unit>>> addTools(CreateToolsParams createToolsParams);
}

class ToolsReoistoryImpl implements ToolsReoistory {
  @override
  Future<Either<Failure, Result<List<TicketTool>>>> ticketTools() async {
    try {
      final ApiClient client = ApiClient(DioProvider().dio);
      final token = await sl<Box>(instanceName: BoxKeys.appBox).get(BoxKeys.usertoken);
      final tickettoolsResponse = await client.getRequest(endpoint: AppLinks.ticketsToolsList, authorization: 'Bearer $token');
      ToolsModel tickettools = ToolsModel.fromJson(tickettoolsResponse.response.data);
      return Right(Result.success(tickettools.tools));
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioError(e));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Result<Unit>>> addTools(CreateToolsParams createToolsParams) async {
    try {
      final ApiClient client = ApiClient(DioProvider().dio);
      final token = await sl<Box>(instanceName: BoxKeys.appBox).get(BoxKeys.usertoken);
      final ticketAddToolsResponse = await client.postRequest(
        endpoint: AppLinks.ticketsAddTools,
        body: createToolsParams.toJson(),
        authorization: 'Bearer $token',
      );
      if (ticketAddToolsResponse.response.data['status'] == false) {
        return Left(ServerFailure.fromResponse(ticketAddToolsResponse.response.statusCode, message: ticketAddToolsResponse.response.data['message']));
      }
      return Right(Result.success(unit));
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioError(e));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
}
