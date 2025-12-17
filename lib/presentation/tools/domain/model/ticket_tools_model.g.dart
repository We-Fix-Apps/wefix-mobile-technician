// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ticket_tools_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TicketToolsModelImpl _$$TicketToolsModelImplFromJson(
        Map<String, dynamic> json) =>
    _$TicketToolsModelImpl(
      ticketTools: (json['ticketTools'] as List<dynamic>?)
          ?.map((e) => TicketTool.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$TicketToolsModelImplToJson(
        _$TicketToolsModelImpl instance) =>
    <String, dynamic>{
      'ticketTools': instance.ticketTools,
    };
