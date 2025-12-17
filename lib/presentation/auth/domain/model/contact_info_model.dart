// To parse this JSON data, do
//
//     final contactInfoModel = contactInfoModelFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'contact_info_model.freezed.dart';
part 'contact_info_model.g.dart';

ContactInfoModel contactInfoModelFromJson(String str) => ContactInfoModel.fromJson(json.decode(str));

String contactInfoModelToJson(ContactInfoModel data) => json.encode(data.toJson());

@freezed
class ContactInfoModel with _$ContactInfoModel {
  const factory ContactInfoModel({@JsonKey(name: "languages") ContactInfo? languages}) = _ContactInfoModel;

  factory ContactInfoModel.fromJson(Map<String, dynamic> json) => _$ContactInfoModelFromJson(json);
}

@freezed
class ContactInfo with _$ContactInfo {
  const factory ContactInfo({
    @JsonKey(name: "id") int? id,
    @JsonKey(name: "phone") String? phone,
    @JsonKey(name: "emegancyPhone") String? emegancyPhone,
    @JsonKey(name: "email") String? email,
    @JsonKey(name: "longitude") String? longitude,
    @JsonKey(name: "latitude") String? latitude,
    @JsonKey(name: "facebook") String? facebook, 
    @JsonKey(name: "linkedin") String? linkedin,
    @JsonKey(name: "twitter") String? twitter,
    @JsonKey(name: "instagram") String? instagram,
    @JsonKey(name: "youtube") String? youtube,
    @JsonKey(name: "whatsapp") String? whatsapp,
  }) = _ContactInfo;

  factory ContactInfo.fromJson(Map<String, dynamic> json) => _$ContactInfoFromJson(json);
}
