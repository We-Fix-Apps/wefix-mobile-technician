import 'package:freezed_annotation/freezed_annotation.dart';

part 'maintenances_list_model.freezed.dart';
part 'maintenances_list_model.g.dart';

@freezed
class MaintenancesListModel with _$MaintenancesListModel {
  const factory MaintenancesListModel({@JsonKey(name: "maintenancesList") List<MaintenancesList>? maintenancesList}) = _MaintenancesListModel;

  factory MaintenancesListModel.fromJson(Map<String, dynamic> json) => _$MaintenancesListModelFromJson(json);
}

@freezed
class SubMaintenance with _$SubMaintenance {
  const factory SubMaintenance({
    @JsonKey(name: "id") int? id,
    @JsonKey(name: "packageTypeId") int? packageTypeId,
    @JsonKey(name: "parentId") int? parentId,
    @JsonKey(name: "name") String? name,
    @JsonKey(name: "nameRoom") String? nameRoom,
    @JsonKey(name: "nameAr") String? nameAr,
    @JsonKey(name: "icon") dynamic icon,
    @JsonKey(name: "isChecked") @Default(false) bool? isChecked,
    @JsonKey(name: "description") String? description,
    @JsonKey(name: "subSubMaintenances") List<MaintenancesList>? subSubMaintenances,
  }) = _SubMaintenance;

  factory SubMaintenance.fromJson(Map<String, dynamic> json) => _$SubMaintenanceFromJson(json);
}

@freezed
class MaintenancesList with _$MaintenancesList {
  const factory MaintenancesList({
    @JsonKey(name: "id") int? id,
    @JsonKey(name: "packageTypeId") int? packageTypeId,
    @JsonKey(name: "parentId") int? parentId,
    @JsonKey(name: "nameRoom") String? nameRoom,
    @JsonKey(name: "name") String? name,
    @JsonKey(name: "nameAr") String? nameAr,
    @JsonKey(name: "icon") dynamic icon,
    @JsonKey(name: "description") String? description,
    @JsonKey(name: "score") int? score,
    @JsonKey(name: "typeName") String? typeName,
    @JsonKey(name: "noteValue") String? noteValue,
    @JsonKey(name: "choices") List<Choice>? choices,
    @JsonKey(name: "isChecked") bool? isChecked,
    @JsonKey(name: "subMaintenances") List<SubMaintenance>? subMaintenances,
    @JsonKey(name: "image") dynamic image,
    @JsonKey(name: "images") List<String>? images,
  }) = _MaintenancesList;

  factory MaintenancesList.fromJson(Map<String, dynamic> json) => _$MaintenancesListFromJson(json);
}

@freezed
class Choice with _$Choice {
  const factory Choice({
    @JsonKey(name: "id") int? id,
    @JsonKey(name: "packageId") int? packageId,
    @JsonKey(name: "parentId") int? parentId,
    @JsonKey(name: "nameRoom") String? nameRoom,
    @JsonKey(name: "name") String? name,
    @JsonKey(name: "nameAr") String? nameAr,
    @JsonKey(name: "isSelected") bool? isSelected,
  }) = _Choice;

  factory Choice.fromJson(Map<String, dynamic> json) => _$ChoiceFromJson(json);
}
