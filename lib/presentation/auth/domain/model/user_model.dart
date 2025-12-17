// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'dart:convert';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

@freezed
class UserModel with _$UserModel {
  const factory UserModel({
    @JsonKey(name: "status") bool? status,
    @JsonKey(name: "token") String? token,
    @JsonKey(name: "message") String? message,
    @JsonKey(name: "user") User? user,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);
}

@freezed
@HiveType(typeId: 0)
class User with _$User {
  const factory User({
    @HiveField(0) @JsonKey(name: "id") int? id,
    @HiveField(2) @JsonKey(name: "name") String? name,
    @HiveField(3) @JsonKey(name: "mobile") String? mobile,
    @HiveField(4) @JsonKey(name: "email") String? email,
    @HiveField(5) @JsonKey(name: "age") String? age,
    @HiveField(6) @JsonKey(name: "profession") String? profession,
    @HiveField(7) @JsonKey(name: "introduce") String? introduce,
    @HiveField(8) @JsonKey(name: "address") String? address,
    @HiveField(9) @JsonKey(name: "dateOfBirth") DateTime? dateOfBirth,
    @HiveField(10) @JsonKey(name: "raring") String? rating,
    @HiveField(11) @JsonKey(name: "image") String? image,
    @HiveField(12) @JsonKey(name: "createdDate") DateTime? createdDate,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
