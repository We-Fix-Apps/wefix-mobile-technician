// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tools_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ToolsModelImpl _$$ToolsModelImplFromJson(Map<String, dynamic> json) =>
    _$ToolsModelImpl(
      tools: (json['tools'] as List<dynamic>?)
          ?.map((e) => TicketTool.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ToolsModelImplToJson(_$ToolsModelImpl instance) =>
    <String, dynamic>{
      'tools': instance.tools,
    };
