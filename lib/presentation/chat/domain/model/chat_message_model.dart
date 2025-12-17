import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_message_model.freezed.dart';
part 'chat_message_model.g.dart';

@freezed
class ChatMessageModel with _$ChatMessageModel {
  const factory ChatMessageModel({@JsonKey(name: "chats") List<Message>? messages}) = _ChatMessageModel;

  factory ChatMessageModel.fromJson(Map<String, dynamic> json) => _$ChatMessageModelFromJson(json);
}

@freezed
class Message with _$Message {
  const factory Message({
    @JsonKey(name: "fromUserId") int? fromUserId,
    @JsonKey(name: "ticketId") int? ticketId,
    @JsonKey(name: "message") String? message,
    @JsonKey(name: "image") String? image,
    @JsonKey(name: "imageUser") String? audio,
    @JsonKey(name: "createdAt") String? createdAt,
    @JsonKey(name: "fromUserName") String? fromUserName,
  }) = _Message;

  factory Message.fromJson(Map<String, dynamic> json) => _$MessageFromJson(json);
}
