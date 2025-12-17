import 'package:freezed_annotation/freezed_annotation.dart';

part 'language_model.freezed.dart';
part 'language_model.g.dart';

@freezed
class AppLanguageModel with _$AppLanguageModel {
  const factory AppLanguageModel({@JsonKey(name: "languages") List<Languages>? languages}) = _AppLanguageModel;

  factory AppLanguageModel.fromJson(Map<String, dynamic> json) => _$AppLanguageModelFromJson(json);
}

@freezed
class Languages with _$Languages {
  const factory Languages({
    @JsonKey(name: "name") dynamic name,
    @JsonKey(name: "flag") dynamic flag,
    @JsonKey(name: "code") dynamic code,
    @JsonKey(name: "lang") dynamic lang,
    @JsonKey(name: "languages") List<SubLanguage>? languages,
    @JsonKey(name: "key") String? key,
  }) = _Languages;

  factory Languages.fromJson(Map<String, dynamic> json) => _$LanguagesFromJson(json);
}

@freezed
class SubLanguage with _$SubLanguage {
  const factory SubLanguage({
    @JsonKey(name: "id") int? id,
    @JsonKey(name: "wordKey") String? wordKey,
    @JsonKey(name: "value") String? value,
    @JsonKey(name: "lang") String? lang,
  }) = _SubLanguage;

  factory SubLanguage.fromJson(Map<String, dynamic> json) => _$SubLanguageFromJson(json);
}
