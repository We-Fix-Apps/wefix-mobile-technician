import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/services/api_services/result_model.dart';
import '../model/chat_message_model.dart';
import '../model/chat_params.dart';
import '../repoistory/chat_repoistory.dart';

class ChatUsecase {
  final ChatRepoistory chatRepository;

  ChatUsecase({required this.chatRepository});

  Future<Either<Failure, Result<List<Message>>>> getMessages(int id) async => chatRepository.getAllChat(id);
  Future<Either<Failure, Unit>> sendMessage(ChatParams params) async => await chatRepository.sendMessage(params);
}
