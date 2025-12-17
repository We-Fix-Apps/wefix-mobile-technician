// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'maintenances_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MaintenancesListModelImpl _$$MaintenancesListModelImplFromJson(
        Map<String, dynamic> json) =>
    _$MaintenancesListModelImpl(
      maintenancesList: (json['maintenancesList'] as List<dynamic>?)
          ?.map((e) => MaintenancesList.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$MaintenancesListModelImplToJson(
        _$MaintenancesListModelImpl instance) =>
    <String, dynamic>{
      'maintenancesList': instance.maintenancesList,
    };

_$SubMaintenanceImpl _$$SubMaintenanceImplFromJson(Map<String, dynamic> json) =>
    _$SubMaintenanceImpl(
      id: (json['id'] as num?)?.toInt(),
      packageTypeId: (json['packageTypeId'] as num?)?.toInt(),
      parentId: (json['parentId'] as num?)?.toInt(),
      name: json['name'] as String?,
      nameRoom: json['nameRoom'] as String?,
      nameAr: json['nameAr'] as String?,
      icon: json['icon'],
      isChecked: json['isChecked'] as bool? ?? false,
      description: json['description'] as String?,
      subSubMaintenances: (json['subSubMaintenances'] as List<dynamic>?)
          ?.map((e) => MaintenancesList.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$SubMaintenanceImplToJson(
        _$SubMaintenanceImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'packageTypeId': instance.packageTypeId,
      'parentId': instance.parentId,
      'name': instance.name,
      'nameRoom': instance.nameRoom,
      'nameAr': instance.nameAr,
      'icon': instance.icon,
      'isChecked': instance.isChecked,
      'description': instance.description,
      'subSubMaintenances': instance.subSubMaintenances,
    };

_$MaintenancesListImpl _$$MaintenancesListImplFromJson(
        Map<String, dynamic> json) =>
    _$MaintenancesListImpl(
      id: (json['id'] as num?)?.toInt(),
      packageTypeId: (json['packageTypeId'] as num?)?.toInt(),
      parentId: (json['parentId'] as num?)?.toInt(),
      nameRoom: json['nameRoom'] as String?,
      name: json['name'] as String?,
      nameAr: json['nameAr'] as String?,
      icon: json['icon'],
      description: json['description'] as String?,
      score: (json['score'] as num?)?.toInt(),
      typeName: json['typeName'] as String?,
      noteValue: json['noteValue'] as String?,
      choices: (json['choices'] as List<dynamic>?)
          ?.map((e) => Choice.fromJson(e as Map<String, dynamic>))
          .toList(),
      isChecked: json['isChecked'] as bool?,
      subMaintenances: (json['subMaintenances'] as List<dynamic>?)
          ?.map((e) => SubMaintenance.fromJson(e as Map<String, dynamic>))
          .toList(),
      image: json['image'],
      images:
          (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$MaintenancesListImplToJson(
        _$MaintenancesListImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'packageTypeId': instance.packageTypeId,
      'parentId': instance.parentId,
      'nameRoom': instance.nameRoom,
      'name': instance.name,
      'nameAr': instance.nameAr,
      'icon': instance.icon,
      'description': instance.description,
      'score': instance.score,
      'typeName': instance.typeName,
      'noteValue': instance.noteValue,
      'choices': instance.choices,
      'isChecked': instance.isChecked,
      'subMaintenances': instance.subMaintenances,
      'image': instance.image,
      'images': instance.images,
    };

_$ChoiceImpl _$$ChoiceImplFromJson(Map<String, dynamic> json) => _$ChoiceImpl(
      id: (json['id'] as num?)?.toInt(),
      packageId: (json['packageId'] as num?)?.toInt(),
      parentId: (json['parentId'] as num?)?.toInt(),
      nameRoom: json['nameRoom'] as String?,
      name: json['name'] as String?,
      nameAr: json['nameAr'] as String?,
      isSelected: json['isSelected'] as bool?,
    );

Map<String, dynamic> _$$ChoiceImplToJson(_$ChoiceImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'packageId': instance.packageId,
      'parentId': instance.parentId,
      'nameRoom': instance.nameRoom,
      'name': instance.name,
      'nameAr': instance.nameAr,
      'isSelected': instance.isSelected,
    };
