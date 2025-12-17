// To parse this JSON data, do
//
//     final contentsModel = contentsModelFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'contents_model.freezed.dart';
part 'contents_model.g.dart';

ContentsModel contentsModelFromJson(String str) => ContentsModel.fromJson(json.decode(str));

String contentsModelToJson(ContentsModel data) => json.encode(data.toJson());

@freezed
class ContentsModel with _$ContentsModel {
  const factory ContentsModel({
    @JsonKey(name: "about") String? about,
    @JsonKey(name: "privacyPolicy") String? privacyPolicy,
    @JsonKey(name: "privacyPolicyAr") String? privacyPolicyAr,
    @JsonKey(name: "termsAndConditions") String? termsAndConditions,
    @JsonKey(name: "termsAndConditionsAr") String? termsAndConditionsAr,
  }) = _ContentsModel;

  factory ContentsModel.fromJson(Map<String, dynamic> json) => _$ContentsModelFromJson(json);
}
