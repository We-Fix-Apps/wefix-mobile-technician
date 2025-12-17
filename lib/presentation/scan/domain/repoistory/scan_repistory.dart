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

abstract class ScanRepistory {
  Future<Either<Failure, Result<String>>> scan(String qrCode);
}

class ScanRepistoryImpl implements ScanRepistory {
  @override
  Future<Either<Failure, Result<String>>> scan(String qrCode) async {
    try {
      final ApiClient client = ApiClient(DioProvider().dio);
      final token = await sl<Box>(instanceName: BoxKeys.appBox).get(BoxKeys.usertoken);
      final scanResponse = await client.postRequest(endpoint: AppLinks.scan, authorization: 'Bearer $token', body: {'QrCode': qrCode});
      if (scanResponse.response.data['status'] == true) {
        return Right(Result.success(scanResponse.response.data['id'].toString()));
      } else {
        return Left(ServerFailure(message: 'Something went wrong'));
      }
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioError(e));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
}
