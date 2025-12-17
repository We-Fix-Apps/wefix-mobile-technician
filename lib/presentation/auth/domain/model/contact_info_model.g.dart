// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ContactInfoModelImpl _$$ContactInfoModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ContactInfoModelImpl(
      languages: json['languages'] == null
          ? null
          : ContactInfo.fromJson(json['languages'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ContactInfoModelImplToJson(
        _$ContactInfoModelImpl instance) =>
    <String, dynamic>{
      'languages': instance.languages,
    };

_$ContactInfoImpl _$$ContactInfoImplFromJson(Map<String, dynamic> json) =>
    _$ContactInfoImpl(
      id: (json['id'] as num?)?.toInt(),
      phone: json['phone'] as String?,
      emegancyPhone: json['emegancyPhone'] as String?,
      email: json['email'] as String?,
      longitude: json['longitude'] as String?,
      latitude: json['latitude'] as String?,
      facebook: json['facebook'] as String?,
      linkedin: json['linkedin'] as String?,
      twitter: json['twitter'] as String?,
      instagram: json['instagram'] as String?,
      youtube: json['youtube'] as String?,
      whatsapp: json['whatsapp'] as String?,
    );

Map<String, dynamic> _$$ContactInfoImplToJson(_$ContactInfoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'phone': instance.phone,
      'emegancyPhone': instance.emegancyPhone,
      'email': instance.email,
      'longitude': instance.longitude,
      'latitude': instance.latitude,
      'facebook': instance.facebook,
      'linkedin': instance.linkedin,
      'twitter': instance.twitter,
      'instagram': instance.instagram,
      'youtube': instance.youtube,
      'whatsapp': instance.whatsapp,
    };
