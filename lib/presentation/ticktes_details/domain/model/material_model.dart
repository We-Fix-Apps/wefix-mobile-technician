import 'package:freezed_annotation/freezed_annotation.dart';

import 'tickets_details_model.dart';

part 'material_model.freezed.dart';
part 'material_model.g.dart';

@freezed
class MaterialModel with _$MaterialModel {
  const factory MaterialModel({@JsonKey(name: "materials") List<TicketMaterial>? materials}) = _MaterialModel;

  factory MaterialModel.fromJson(Map<String, dynamic> json) => _$MaterialModelFromJson(json);
}

 
