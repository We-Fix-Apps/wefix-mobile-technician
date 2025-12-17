// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tools_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ToolsModel _$ToolsModelFromJson(Map<String, dynamic> json) {
  return _ToolsModel.fromJson(json);
}

/// @nodoc
mixin _$ToolsModel {
  @JsonKey(name: "tools")
  List<TicketTool>? get tools => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ToolsModelCopyWith<ToolsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ToolsModelCopyWith<$Res> {
  factory $ToolsModelCopyWith(
          ToolsModel value, $Res Function(ToolsModel) then) =
      _$ToolsModelCopyWithImpl<$Res, ToolsModel>;
  @useResult
  $Res call({@JsonKey(name: "tools") List<TicketTool>? tools});
}

/// @nodoc
class _$ToolsModelCopyWithImpl<$Res, $Val extends ToolsModel>
    implements $ToolsModelCopyWith<$Res> {
  _$ToolsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tools = freezed,
  }) {
    return _then(_value.copyWith(
      tools: freezed == tools
          ? _value.tools
          : tools // ignore: cast_nullable_to_non_nullable
              as List<TicketTool>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ToolsModelImplCopyWith<$Res>
    implements $ToolsModelCopyWith<$Res> {
  factory _$$ToolsModelImplCopyWith(
          _$ToolsModelImpl value, $Res Function(_$ToolsModelImpl) then) =
      __$$ToolsModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: "tools") List<TicketTool>? tools});
}

/// @nodoc
class __$$ToolsModelImplCopyWithImpl<$Res>
    extends _$ToolsModelCopyWithImpl<$Res, _$ToolsModelImpl>
    implements _$$ToolsModelImplCopyWith<$Res> {
  __$$ToolsModelImplCopyWithImpl(
      _$ToolsModelImpl _value, $Res Function(_$ToolsModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tools = freezed,
  }) {
    return _then(_$ToolsModelImpl(
      tools: freezed == tools
          ? _value._tools
          : tools // ignore: cast_nullable_to_non_nullable
              as List<TicketTool>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ToolsModelImpl implements _ToolsModel {
  const _$ToolsModelImpl(
      {@JsonKey(name: "tools") final List<TicketTool>? tools})
      : _tools = tools;

  factory _$ToolsModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ToolsModelImplFromJson(json);

  final List<TicketTool>? _tools;
  @override
  @JsonKey(name: "tools")
  List<TicketTool>? get tools {
    final value = _tools;
    if (value == null) return null;
    if (_tools is EqualUnmodifiableListView) return _tools;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'ToolsModel(tools: $tools)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ToolsModelImpl &&
            const DeepCollectionEquality().equals(other._tools, _tools));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_tools));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ToolsModelImplCopyWith<_$ToolsModelImpl> get copyWith =>
      __$$ToolsModelImplCopyWithImpl<_$ToolsModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ToolsModelImplToJson(
      this,
    );
  }
}

abstract class _ToolsModel implements ToolsModel {
  const factory _ToolsModel(
          {@JsonKey(name: "tools") final List<TicketTool>? tools}) =
      _$ToolsModelImpl;

  factory _ToolsModel.fromJson(Map<String, dynamic> json) =
      _$ToolsModelImpl.fromJson;

  @override
  @JsonKey(name: "tools")
  List<TicketTool>? get tools;
  @override
  @JsonKey(ignore: true)
  _$$ToolsModelImplCopyWith<_$ToolsModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
