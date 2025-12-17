// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

HomeModel _$HomeModelFromJson(Map<String, dynamic> json) {
  return _HomeModel.fromJson(json);
}

/// @nodoc
mixin _$HomeModel {
  @JsonKey(name: "tickets")
  List<Tickets>? get tickets => throw _privateConstructorUsedError;
  @JsonKey(name: "ticketsTomorrow")
  List<Tickets>? get ticketsTomorrow => throw _privateConstructorUsedError;
  @JsonKey(name: "emergency")
  List<Tickets>? get emergency => throw _privateConstructorUsedError;
  @JsonKey(name: "rating")
  int? get rating => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HomeModelCopyWith<HomeModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeModelCopyWith<$Res> {
  factory $HomeModelCopyWith(HomeModel value, $Res Function(HomeModel) then) =
      _$HomeModelCopyWithImpl<$Res, HomeModel>;
  @useResult
  $Res call(
      {@JsonKey(name: "tickets") List<Tickets>? tickets,
      @JsonKey(name: "ticketsTomorrow") List<Tickets>? ticketsTomorrow,
      @JsonKey(name: "emergency") List<Tickets>? emergency,
      @JsonKey(name: "rating") int? rating});
}

/// @nodoc
class _$HomeModelCopyWithImpl<$Res, $Val extends HomeModel>
    implements $HomeModelCopyWith<$Res> {
  _$HomeModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tickets = freezed,
    Object? ticketsTomorrow = freezed,
    Object? emergency = freezed,
    Object? rating = freezed,
  }) {
    return _then(_value.copyWith(
      tickets: freezed == tickets
          ? _value.tickets
          : tickets // ignore: cast_nullable_to_non_nullable
              as List<Tickets>?,
      ticketsTomorrow: freezed == ticketsTomorrow
          ? _value.ticketsTomorrow
          : ticketsTomorrow // ignore: cast_nullable_to_non_nullable
              as List<Tickets>?,
      emergency: freezed == emergency
          ? _value.emergency
          : emergency // ignore: cast_nullable_to_non_nullable
              as List<Tickets>?,
      rating: freezed == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HomeModelImplCopyWith<$Res>
    implements $HomeModelCopyWith<$Res> {
  factory _$$HomeModelImplCopyWith(
          _$HomeModelImpl value, $Res Function(_$HomeModelImpl) then) =
      __$$HomeModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "tickets") List<Tickets>? tickets,
      @JsonKey(name: "ticketsTomorrow") List<Tickets>? ticketsTomorrow,
      @JsonKey(name: "emergency") List<Tickets>? emergency,
      @JsonKey(name: "rating") int? rating});
}

/// @nodoc
class __$$HomeModelImplCopyWithImpl<$Res>
    extends _$HomeModelCopyWithImpl<$Res, _$HomeModelImpl>
    implements _$$HomeModelImplCopyWith<$Res> {
  __$$HomeModelImplCopyWithImpl(
      _$HomeModelImpl _value, $Res Function(_$HomeModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tickets = freezed,
    Object? ticketsTomorrow = freezed,
    Object? emergency = freezed,
    Object? rating = freezed,
  }) {
    return _then(_$HomeModelImpl(
      tickets: freezed == tickets
          ? _value._tickets
          : tickets // ignore: cast_nullable_to_non_nullable
              as List<Tickets>?,
      ticketsTomorrow: freezed == ticketsTomorrow
          ? _value._ticketsTomorrow
          : ticketsTomorrow // ignore: cast_nullable_to_non_nullable
              as List<Tickets>?,
      emergency: freezed == emergency
          ? _value._emergency
          : emergency // ignore: cast_nullable_to_non_nullable
              as List<Tickets>?,
      rating: freezed == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$HomeModelImpl implements _HomeModel {
  const _$HomeModelImpl(
      {@JsonKey(name: "tickets") final List<Tickets>? tickets,
      @JsonKey(name: "ticketsTomorrow") final List<Tickets>? ticketsTomorrow,
      @JsonKey(name: "emergency") final List<Tickets>? emergency,
      @JsonKey(name: "rating") this.rating})
      : _tickets = tickets,
        _ticketsTomorrow = ticketsTomorrow,
        _emergency = emergency;

  factory _$HomeModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$HomeModelImplFromJson(json);

  final List<Tickets>? _tickets;
  @override
  @JsonKey(name: "tickets")
  List<Tickets>? get tickets {
    final value = _tickets;
    if (value == null) return null;
    if (_tickets is EqualUnmodifiableListView) return _tickets;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<Tickets>? _ticketsTomorrow;
  @override
  @JsonKey(name: "ticketsTomorrow")
  List<Tickets>? get ticketsTomorrow {
    final value = _ticketsTomorrow;
    if (value == null) return null;
    if (_ticketsTomorrow is EqualUnmodifiableListView) return _ticketsTomorrow;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<Tickets>? _emergency;
  @override
  @JsonKey(name: "emergency")
  List<Tickets>? get emergency {
    final value = _emergency;
    if (value == null) return null;
    if (_emergency is EqualUnmodifiableListView) return _emergency;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: "rating")
  final int? rating;

  @override
  String toString() {
    return 'HomeModel(tickets: $tickets, ticketsTomorrow: $ticketsTomorrow, emergency: $emergency, rating: $rating)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomeModelImpl &&
            const DeepCollectionEquality().equals(other._tickets, _tickets) &&
            const DeepCollectionEquality()
                .equals(other._ticketsTomorrow, _ticketsTomorrow) &&
            const DeepCollectionEquality()
                .equals(other._emergency, _emergency) &&
            (identical(other.rating, rating) || other.rating == rating));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_tickets),
      const DeepCollectionEquality().hash(_ticketsTomorrow),
      const DeepCollectionEquality().hash(_emergency),
      rating);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HomeModelImplCopyWith<_$HomeModelImpl> get copyWith =>
      __$$HomeModelImplCopyWithImpl<_$HomeModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HomeModelImplToJson(
      this,
    );
  }
}

abstract class _HomeModel implements HomeModel {
  const factory _HomeModel(
      {@JsonKey(name: "tickets") final List<Tickets>? tickets,
      @JsonKey(name: "ticketsTomorrow") final List<Tickets>? ticketsTomorrow,
      @JsonKey(name: "emergency") final List<Tickets>? emergency,
      @JsonKey(name: "rating") final int? rating}) = _$HomeModelImpl;

  factory _HomeModel.fromJson(Map<String, dynamic> json) =
      _$HomeModelImpl.fromJson;

  @override
  @JsonKey(name: "tickets")
  List<Tickets>? get tickets;
  @override
  @JsonKey(name: "ticketsTomorrow")
  List<Tickets>? get ticketsTomorrow;
  @override
  @JsonKey(name: "emergency")
  List<Tickets>? get emergency;
  @override
  @JsonKey(name: "rating")
  int? get rating;
  @override
  @JsonKey(ignore: true)
  _$$HomeModelImplCopyWith<_$HomeModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Tickets _$TicketsFromJson(Map<String, dynamic> json) {
  return _Tickets.fromJson(json);
}

/// @nodoc
mixin _$Tickets {
  @JsonKey(name: "id")
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: "image")
  String? get image => throw _privateConstructorUsedError;
  @JsonKey(name: "customer")
  String? get customer => throw _privateConstructorUsedError;
  @JsonKey(name: "date")
  DateTime? get date => throw _privateConstructorUsedError;
  @JsonKey(name: "status")
  String? get status => throw _privateConstructorUsedError;
  @JsonKey(name: "time")
  String? get time => throw _privateConstructorUsedError;
  @JsonKey(name: "ticketType")
  String? get ticketType => throw _privateConstructorUsedError;
  @JsonKey(name: "ticketTypeAr")
  String? get ticketTypeAr => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TicketsCopyWith<Tickets> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TicketsCopyWith<$Res> {
  factory $TicketsCopyWith(Tickets value, $Res Function(Tickets) then) =
      _$TicketsCopyWithImpl<$Res, Tickets>;
  @useResult
  $Res call(
      {@JsonKey(name: "id") int? id,
      @JsonKey(name: "image") String? image,
      @JsonKey(name: "customer") String? customer,
      @JsonKey(name: "date") DateTime? date,
      @JsonKey(name: "status") String? status,
      @JsonKey(name: "time") String? time,
      @JsonKey(name: "ticketType") String? ticketType,
      @JsonKey(name: "ticketTypeAr") String? ticketTypeAr});
}

/// @nodoc
class _$TicketsCopyWithImpl<$Res, $Val extends Tickets>
    implements $TicketsCopyWith<$Res> {
  _$TicketsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? image = freezed,
    Object? customer = freezed,
    Object? date = freezed,
    Object? status = freezed,
    Object? time = freezed,
    Object? ticketType = freezed,
    Object? ticketTypeAr = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      customer: freezed == customer
          ? _value.customer
          : customer // ignore: cast_nullable_to_non_nullable
              as String?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      time: freezed == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as String?,
      ticketType: freezed == ticketType
          ? _value.ticketType
          : ticketType // ignore: cast_nullable_to_non_nullable
              as String?,
      ticketTypeAr: freezed == ticketTypeAr
          ? _value.ticketTypeAr
          : ticketTypeAr // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TicketsImplCopyWith<$Res> implements $TicketsCopyWith<$Res> {
  factory _$$TicketsImplCopyWith(
          _$TicketsImpl value, $Res Function(_$TicketsImpl) then) =
      __$$TicketsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "id") int? id,
      @JsonKey(name: "image") String? image,
      @JsonKey(name: "customer") String? customer,
      @JsonKey(name: "date") DateTime? date,
      @JsonKey(name: "status") String? status,
      @JsonKey(name: "time") String? time,
      @JsonKey(name: "ticketType") String? ticketType,
      @JsonKey(name: "ticketTypeAr") String? ticketTypeAr});
}

/// @nodoc
class __$$TicketsImplCopyWithImpl<$Res>
    extends _$TicketsCopyWithImpl<$Res, _$TicketsImpl>
    implements _$$TicketsImplCopyWith<$Res> {
  __$$TicketsImplCopyWithImpl(
      _$TicketsImpl _value, $Res Function(_$TicketsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? image = freezed,
    Object? customer = freezed,
    Object? date = freezed,
    Object? status = freezed,
    Object? time = freezed,
    Object? ticketType = freezed,
    Object? ticketTypeAr = freezed,
  }) {
    return _then(_$TicketsImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      customer: freezed == customer
          ? _value.customer
          : customer // ignore: cast_nullable_to_non_nullable
              as String?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      time: freezed == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as String?,
      ticketType: freezed == ticketType
          ? _value.ticketType
          : ticketType // ignore: cast_nullable_to_non_nullable
              as String?,
      ticketTypeAr: freezed == ticketTypeAr
          ? _value.ticketTypeAr
          : ticketTypeAr // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TicketsImpl implements _Tickets {
  const _$TicketsImpl(
      {@JsonKey(name: "id") this.id,
      @JsonKey(name: "image") this.image,
      @JsonKey(name: "customer") this.customer,
      @JsonKey(name: "date") this.date,
      @JsonKey(name: "status") this.status,
      @JsonKey(name: "time") this.time,
      @JsonKey(name: "ticketType") this.ticketType,
      @JsonKey(name: "ticketTypeAr") this.ticketTypeAr});

  factory _$TicketsImpl.fromJson(Map<String, dynamic> json) =>
      _$$TicketsImplFromJson(json);

  @override
  @JsonKey(name: "id")
  final int? id;
  @override
  @JsonKey(name: "image")
  final String? image;
  @override
  @JsonKey(name: "customer")
  final String? customer;
  @override
  @JsonKey(name: "date")
  final DateTime? date;
  @override
  @JsonKey(name: "status")
  final String? status;
  @override
  @JsonKey(name: "time")
  final String? time;
  @override
  @JsonKey(name: "ticketType")
  final String? ticketType;
  @override
  @JsonKey(name: "ticketTypeAr")
  final String? ticketTypeAr;

  @override
  String toString() {
    return 'Tickets(id: $id, image: $image, customer: $customer, date: $date, status: $status, time: $time, ticketType: $ticketType, ticketTypeAr: $ticketTypeAr)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TicketsImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.customer, customer) ||
                other.customer == customer) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.time, time) || other.time == time) &&
            (identical(other.ticketType, ticketType) ||
                other.ticketType == ticketType) &&
            (identical(other.ticketTypeAr, ticketTypeAr) ||
                other.ticketTypeAr == ticketTypeAr));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, image, customer, date,
      status, time, ticketType, ticketTypeAr);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TicketsImplCopyWith<_$TicketsImpl> get copyWith =>
      __$$TicketsImplCopyWithImpl<_$TicketsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TicketsImplToJson(
      this,
    );
  }
}

abstract class _Tickets implements Tickets {
  const factory _Tickets(
          {@JsonKey(name: "id") final int? id,
          @JsonKey(name: "image") final String? image,
          @JsonKey(name: "customer") final String? customer,
          @JsonKey(name: "date") final DateTime? date,
          @JsonKey(name: "status") final String? status,
          @JsonKey(name: "time") final String? time,
          @JsonKey(name: "ticketType") final String? ticketType,
          @JsonKey(name: "ticketTypeAr") final String? ticketTypeAr}) =
      _$TicketsImpl;

  factory _Tickets.fromJson(Map<String, dynamic> json) = _$TicketsImpl.fromJson;

  @override
  @JsonKey(name: "id")
  int? get id;
  @override
  @JsonKey(name: "image")
  String? get image;
  @override
  @JsonKey(name: "customer")
  String? get customer;
  @override
  @JsonKey(name: "date")
  DateTime? get date;
  @override
  @JsonKey(name: "status")
  String? get status;
  @override
  @JsonKey(name: "time")
  String? get time;
  @override
  @JsonKey(name: "ticketType")
  String? get ticketType;
  @override
  @JsonKey(name: "ticketTypeAr")
  String? get ticketTypeAr;
  @override
  @JsonKey(ignore: true)
  _$$TicketsImplCopyWith<_$TicketsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
