// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'material_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MaterialModelImpl _$$MaterialModelImplFromJson(Map<String, dynamic> json) =>
    _$MaterialModelImpl(
      materials: (json['materials'] as List<dynamic>?)
          ?.map((e) => TicketMaterial.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$MaterialModelImplToJson(_$MaterialModelImpl instance) =>
    <String, dynamic>{
      'materials': instance.materials,
    };
