import 'package:freezed_annotation/freezed_annotation.dart';

import 'tickets_details_model.dart';

part 'tools_model.freezed.dart';
part 'tools_model.g.dart';

@freezed
class ToolsModel with _$ToolsModel {
  const factory ToolsModel({@JsonKey(name: "tools") List<TicketTool>? tools}) = _ToolsModel;

  factory ToolsModel.fromJson(Map<String, dynamic> json) => _$ToolsModelFromJson(json);
}
