import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_model.freezed.dart';
part 'home_model.g.dart';

@freezed
class HomeModel with _$HomeModel {
  const factory HomeModel({
    @JsonKey(name: "tickets") List<Tickets>? tickets,
    @JsonKey(name: "ticketsTomorrow") List<Tickets>? ticketsTomorrow,
    @JsonKey(name: "emergency") List<Tickets>? emergency,
    @JsonKey(name: "rating") int? rating,
  }) = _HomeModel;

  factory HomeModel.fromJson(Map<String, dynamic> json) => _$HomeModelFromJson(json);
}

@freezed
class Tickets with _$Tickets {
  const factory Tickets({
    @JsonKey(name: "id") int? id,
    @JsonKey(name: "image") String? image,
    @JsonKey(name: "customer") String? customer,
    @JsonKey(name: "date") DateTime? date,
    @JsonKey(name: "status") String? status,
    @JsonKey(name: "time") String? time,
    @JsonKey(name: "ticketType") String? ticketType,
    @JsonKey(name: "ticketTypeAr") String? ticketTypeAr,
  }) = _Tickets;

  factory Tickets.fromJson(Map<String, dynamic> json) => _$TicketsFromJson(json);
}
