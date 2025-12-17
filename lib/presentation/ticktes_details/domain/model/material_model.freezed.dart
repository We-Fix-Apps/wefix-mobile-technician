// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'material_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MaterialModel _$MaterialModelFromJson(Map<String, dynamic> json) {
  return _MaterialModel.fromJson(json);
}

/// @nodoc
mixin _$MaterialModel {
  @JsonKey(name: "materials")
  List<TicketMaterial>? get materials => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MaterialModelCopyWith<MaterialModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MaterialModelCopyWith<$Res> {
  factory $MaterialModelCopyWith(
          MaterialModel value, $Res Function(MaterialModel) then) =
      _$MaterialModelCopyWithImpl<$Res, MaterialModel>;
  @useResult
  $Res call({@JsonKey(name: "materials") List<TicketMaterial>? materials});
}

/// @nodoc
class _$MaterialModelCopyWithImpl<$Res, $Val extends MaterialModel>
    implements $MaterialModelCopyWith<$Res> {
  _$MaterialModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? materials = freezed,
  }) {
    return _then(_value.copyWith(
      materials: freezed == materials
          ? _value.materials
          : materials // ignore: cast_nullable_to_non_nullable
              as List<TicketMaterial>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MaterialModelImplCopyWith<$Res>
    implements $MaterialModelCopyWith<$Res> {
  factory _$$MaterialModelImplCopyWith(
          _$MaterialModelImpl value, $Res Function(_$MaterialModelImpl) then) =
      __$$MaterialModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: "materials") List<TicketMaterial>? materials});
}

/// @nodoc
class __$$MaterialModelImplCopyWithImpl<$Res>
    extends _$MaterialModelCopyWithImpl<$Res, _$MaterialModelImpl>
    implements _$$MaterialModelImplCopyWith<$Res> {
  __$$MaterialModelImplCopyWithImpl(
      _$MaterialModelImpl _value, $Res Function(_$MaterialModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? materials = freezed,
  }) {
    return _then(_$MaterialModelImpl(
      materials: freezed == materials
          ? _value._materials
          : materials // ignore: cast_nullable_to_non_nullable
              as List<TicketMaterial>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MaterialModelImpl implements _MaterialModel {
  const _$MaterialModelImpl(
      {@JsonKey(name: "materials") final List<TicketMaterial>? materials})
      : _materials = materials;

  factory _$MaterialModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$MaterialModelImplFromJson(json);

  final List<TicketMaterial>? _materials;
  @override
  @JsonKey(name: "materials")
  List<TicketMaterial>? get materials {
    final value = _materials;
    if (value == null) return null;
    if (_materials is EqualUnmodifiableListView) return _materials;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'MaterialModel(materials: $materials)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MaterialModelImpl &&
            const DeepCollectionEquality()
                .equals(other._materials, _materials));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_materials));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MaterialModelImplCopyWith<_$MaterialModelImpl> get copyWith =>
      __$$MaterialModelImplCopyWithImpl<_$MaterialModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MaterialModelImplToJson(
      this,
    );
  }
}

abstract class _MaterialModel implements MaterialModel {
  const factory _MaterialModel(
          {@JsonKey(name: "materials") final List<TicketMaterial>? materials}) =
      _$MaterialModelImpl;

  factory _MaterialModel.fromJson(Map<String, dynamic> json) =
      _$MaterialModelImpl.fromJson;

  @override
  @JsonKey(name: "materials")
  List<TicketMaterial>? get materials;
  @override
  @JsonKey(ignore: true)
  _$$MaterialModelImplCopyWith<_$MaterialModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
