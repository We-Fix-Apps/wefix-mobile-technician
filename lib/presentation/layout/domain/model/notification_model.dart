// To parse this JSON data, do
//
//     final notificationModel = notificationModelFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'notification_model.freezed.dart';
part 'notification_model.g.dart';

NotificationModel notificationModelFromJson(String str) => NotificationModel.fromJson(json.decode(str));

String notificationModelToJson(NotificationModel data) => json.encode(data.toJson());

@freezed
class NotificationModel with _$NotificationModel {
  const factory NotificationModel({@JsonKey(name: "notification") List<Notification>? notification}) = _NotificationModel;

  factory NotificationModel.fromJson(Map<String, dynamic> json) => _$NotificationModelFromJson(json);
}

@freezed
class Notification with _$Notification {
  const factory Notification({
    @JsonKey(name: "id") int? id,
    @JsonKey(name: "userId") int? userId,
    @JsonKey(name: "title") String? title,
    @JsonKey(name: "titleAr") String? titleAr,
    @JsonKey(name: "description") String? description,
    @JsonKey(name: "descriptionAr") String? descriptionAr,
    @JsonKey(name: "isRead") bool? isRead,
    @JsonKey(name: "createdDate") DateTime? createdDate,
    @JsonKey(name: "user") dynamic user,
  }) = _Notification;

  factory Notification.fromJson(Map<String, dynamic> json) => _$NotificationFromJson(json);
}
