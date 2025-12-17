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
import '../model/notification_model.dart';

abstract class NotificationRepository {
  Future<Either<Failure, Result<NotificationModel>>> getNotifications();
}

class NotificationRepositoryImpl implements NotificationRepository {
  @override
  Future<Either<Failure, Result<NotificationModel>>> getNotifications() async {
    try {
      final ApiClient client = ApiClient(DioProvider().dio);
      final token = await sl<Box>(instanceName: BoxKeys.appBox).get(BoxKeys.usertoken);
      final notificationResponse = await client.getRequest(endpoint: AppLinks.notification, authorization: 'Bearer $token');
      NotificationModel notificationModel = NotificationModel.fromJson(notificationResponse.response.data);
      return Right(Result.success(notificationModel));
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioError(e));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
}
