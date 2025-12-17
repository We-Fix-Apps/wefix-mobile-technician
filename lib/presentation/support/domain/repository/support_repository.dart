import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:hive/hive.dart';

import '../../../../core/constant/app_links.dart';
import '../../../../core/errors/dio_exp.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/services/api_services/api_client.dart';
import '../../../../core/services/api_services/dio_helper.dart';
import '../../../../core/services/hive_services/box_kes.dart';
import '../../../../injection_container.dart';
import '../model/support_params.dart';

abstract class SupportRepository {
  Future<Either<Failure, Unit>> sendSupport(SupportParams supportParams);
}

class SupportRepositoryImpl implements SupportRepository {
  @override
  Future<Either<Failure, Unit>> sendSupport(SupportParams supportParams) async {
    try {
      final ApiClient client = ApiClient(DioProvider().dio);
      final token = await sl<Box>(instanceName: BoxKeys.appBox).get(BoxKeys.usertoken);
      await client.postRequest(endpoint: AppLinks.support, authorization: 'Bearer $token', body: supportParams.toJson());
      return const Right(unit);
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioError(e));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
}
