// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HomeModelImpl _$$HomeModelImplFromJson(Map<String, dynamic> json) =>
    _$HomeModelImpl(
      tickets: (json['tickets'] as List<dynamic>?)
          ?.map((e) => Tickets.fromJson(e as Map<String, dynamic>))
          .toList(),
      ticketsTomorrow: (json['ticketsTomorrow'] as List<dynamic>?)
          ?.map((e) => Tickets.fromJson(e as Map<String, dynamic>))
          .toList(),
      emergency: (json['emergency'] as List<dynamic>?)
          ?.map((e) => Tickets.fromJson(e as Map<String, dynamic>))
          .toList(),
      rating: (json['rating'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$HomeModelImplToJson(_$HomeModelImpl instance) =>
    <String, dynamic>{
      'tickets': instance.tickets,
      'ticketsTomorrow': instance.ticketsTomorrow,
      'emergency': instance.emergency,
      'rating': instance.rating,
    };

_$TicketsImpl _$$TicketsImplFromJson(Map<String, dynamic> json) =>
    _$TicketsImpl(
      id: (json['id'] as num?)?.toInt(),
      image: json['image'] as String?,
      customer: json['customer'] as String?,
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
      status: json['status'] as String?,
      time: json['time'] as String?,
      ticketType: json['ticketType'] as String?,
      ticketTypeAr: json['ticketTypeAr'] as String?,
    );

Map<String, dynamic> _$$TicketsImplToJson(_$TicketsImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'image': instance.image,
      'customer': instance.customer,
      'date': instance.date?.toIso8601String(),
      'status': instance.status,
      'time': instance.time,
      'ticketType': instance.ticketType,
      'ticketTypeAr': instance.ticketTypeAr,
    };
