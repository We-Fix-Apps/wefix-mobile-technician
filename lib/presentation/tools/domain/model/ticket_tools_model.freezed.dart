// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ticket_tools_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TicketToolsModel _$TicketToolsModelFromJson(Map<String, dynamic> json) {
  return _TicketToolsModel.fromJson(json);
}

/// @nodoc
mixin _$TicketToolsModel {
  @JsonKey(name: "ticketTools")
  List<TicketTool>? get ticketTools => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TicketToolsModelCopyWith<TicketToolsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TicketToolsModelCopyWith<$Res> {
  factory $TicketToolsModelCopyWith(
          TicketToolsModel value, $Res Function(TicketToolsModel) then) =
      _$TicketToolsModelCopyWithImpl<$Res, TicketToolsModel>;
  @useResult
  $Res call({@JsonKey(name: "ticketTools") List<TicketTool>? ticketTools});
}

/// @nodoc
class _$TicketToolsModelCopyWithImpl<$Res, $Val extends TicketToolsModel>
    implements $TicketToolsModelCopyWith<$Res> {
  _$TicketToolsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ticketTools = freezed,
  }) {
    return _then(_value.copyWith(
      ticketTools: freezed == ticketTools
          ? _value.ticketTools
          : ticketTools // ignore: cast_nullable_to_non_nullable
              as List<TicketTool>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TicketToolsModelImplCopyWith<$Res>
    implements $TicketToolsModelCopyWith<$Res> {
  factory _$$TicketToolsModelImplCopyWith(_$TicketToolsModelImpl value,
          $Res Function(_$TicketToolsModelImpl) then) =
      __$$TicketToolsModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: "ticketTools") List<TicketTool>? ticketTools});
}

/// @nodoc
class __$$TicketToolsModelImplCopyWithImpl<$Res>
    extends _$TicketToolsModelCopyWithImpl<$Res, _$TicketToolsModelImpl>
    implements _$$TicketToolsModelImplCopyWith<$Res> {
  __$$TicketToolsModelImplCopyWithImpl(_$TicketToolsModelImpl _value,
      $Res Function(_$TicketToolsModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ticketTools = freezed,
  }) {
    return _then(_$TicketToolsModelImpl(
      ticketTools: freezed == ticketTools
          ? _value._ticketTools
          : ticketTools // ignore: cast_nullable_to_non_nullable
              as List<TicketTool>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TicketToolsModelImpl implements _TicketToolsModel {
  const _$TicketToolsModelImpl(
      {@JsonKey(name: "ticketTools") final List<TicketTool>? ticketTools})
      : _ticketTools = ticketTools;

  factory _$TicketToolsModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$TicketToolsModelImplFromJson(json);

  final List<TicketTool>? _ticketTools;
  @override
  @JsonKey(name: "ticketTools")
  List<TicketTool>? get ticketTools {
    final value = _ticketTools;
    if (value == null) return null;
    if (_ticketTools is EqualUnmodifiableListView) return _ticketTools;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'TicketToolsModel(ticketTools: $ticketTools)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TicketToolsModelImpl &&
            const DeepCollectionEquality()
                .equals(other._ticketTools, _ticketTools));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_ticketTools));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TicketToolsModelImplCopyWith<_$TicketToolsModelImpl> get copyWith =>
      __$$TicketToolsModelImplCopyWithImpl<_$TicketToolsModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TicketToolsModelImplToJson(
      this,
    );
  }
}

abstract class _TicketToolsModel implements TicketToolsModel {
  const factory _TicketToolsModel(
          {@JsonKey(name: "ticketTools") final List<TicketTool>? ticketTools}) =
      _$TicketToolsModelImpl;

  factory _TicketToolsModel.fromJson(Map<String, dynamic> json) =
      _$TicketToolsModelImpl.fromJson;

  @override
  @JsonKey(name: "ticketTools")
  List<TicketTool>? get ticketTools;
  @override
  @JsonKey(ignore: true)
  _$$TicketToolsModelImplCopyWith<_$TicketToolsModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
