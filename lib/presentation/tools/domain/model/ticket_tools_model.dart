import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../ticktes_details/domain/model/tickets_details_model.dart';

part 'ticket_tools_model.freezed.dart';
part 'ticket_tools_model.g.dart';

@freezed
class TicketToolsModel with _$TicketToolsModel {
  const factory TicketToolsModel({@JsonKey(name: "ticketTools") List<TicketTool>? ticketTools}) = _TicketToolsModel;

  factory TicketToolsModel.fromJson(Map<String, dynamic> json) => _$TicketToolsModelFromJson(json);
}

 
