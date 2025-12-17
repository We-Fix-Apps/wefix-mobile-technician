// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'language_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AppLanguageModelImpl _$$AppLanguageModelImplFromJson(
        Map<String, dynamic> json) =>
    _$AppLanguageModelImpl(
      languages: (json['languages'] as List<dynamic>?)
          ?.map((e) => Languages.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$AppLanguageModelImplToJson(
        _$AppLanguageModelImpl instance) =>
    <String, dynamic>{
      'languages': instance.languages,
    };

_$LanguagesImpl _$$LanguagesImplFromJson(Map<String, dynamic> json) =>
    _$LanguagesImpl(
      name: json['name'],
      flag: json['flag'],
      code: json['code'],
      lang: json['lang'],
      languages: (json['languages'] as List<dynamic>?)
          ?.map((e) => SubLanguage.fromJson(e as Map<String, dynamic>))
          .toList(),
      key: json['key'] as String?,
    );

Map<String, dynamic> _$$LanguagesImplToJson(_$LanguagesImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'flag': instance.flag,
      'code': instance.code,
      'lang': instance.lang,
      'languages': instance.languages,
      'key': instance.key,
    };

_$SubLanguageImpl _$$SubLanguageImplFromJson(Map<String, dynamic> json) =>
    _$SubLanguageImpl(
      id: (json['id'] as num?)?.toInt(),
      wordKey: json['wordKey'] as String?,
      value: json['value'] as String?,
      lang: json['lang'] as String?,
    );

Map<String, dynamic> _$$SubLanguageImplToJson(_$SubLanguageImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'wordKey': instance.wordKey,
      'value': instance.value,
      'lang': instance.lang,
    };
