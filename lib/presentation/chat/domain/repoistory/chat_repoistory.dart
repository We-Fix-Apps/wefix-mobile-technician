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
import '../model/chat_message_model.dart';
import '../model/chat_params.dart';

abstract class ChatRepoistory {
  Future<Either<Failure, Result<List<Message>>>> getAllChat(int id);
  Future<Either<Failure, Unit>> sendMessage(ChatParams params);
}

class ChatRepoistoryImpl implements ChatRepoistory {
  @override
  Future<Either<Failure, Result<List<Message>>>> getAllChat(int id) async {
    try {
      final ApiClient client = ApiClient(DioProvider().dio);
      final token = await sl<Box>(instanceName: BoxKeys.appBox).get(BoxKeys.usertoken);
      final result = await client.getRequest(endpoint: '${AppLinks.chatGetMessages}$id', authorization: 'Bearer $token');
      ChatMessageModel data = ChatMessageModel.fromJson(result.response.data);
      return Right(Result.success(data.messages ?? []));
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioError(e));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> sendMessage(ChatParams params) async {
    try {
      final ApiClient client = ApiClient(DioProvider().dio);
      final token = await sl<Box>(instanceName: BoxKeys.appBox).get(BoxKeys.usertoken);
      await client.postRequest(endpoint: AppLinks.chatSendMessage, authorization: 'Bearer $token', body: params.toJson());
      return const Right(unit);
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioError(e));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
}
