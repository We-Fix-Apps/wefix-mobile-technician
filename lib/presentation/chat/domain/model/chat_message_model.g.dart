// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_message_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChatMessageModelImpl _$$ChatMessageModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ChatMessageModelImpl(
      messages: (json['chats'] as List<dynamic>?)
          ?.map((e) => Message.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ChatMessageModelImplToJson(
        _$ChatMessageModelImpl instance) =>
    <String, dynamic>{
      'chats': instance.messages,
    };

_$MessageImpl _$$MessageImplFromJson(Map<String, dynamic> json) =>
    _$MessageImpl(
      fromUserId: (json['fromUserId'] as num?)?.toInt(),
      ticketId: (json['ticketId'] as num?)?.toInt(),
      message: json['message'] as String?,
      image: json['image'] as String?,
      audio: json['imageUser'] as String?,
      createdAt: json['createdAt'] as String?,
      fromUserName: json['fromUserName'] as String?,
    );

Map<String, dynamic> _$$MessageImplToJson(_$MessageImpl instance) =>
    <String, dynamic>{
      'fromUserId': instance.fromUserId,
      'ticketId': instance.ticketId,
      'message': instance.message,
      'image': instance.image,
      'imageUser': instance.audio,
      'createdAt': instance.createdAt,
      'fromUserName': instance.fromUserName,
    };
