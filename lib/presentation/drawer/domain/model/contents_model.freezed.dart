// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'contents_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ContentsModel _$ContentsModelFromJson(Map<String, dynamic> json) {
  return _ContentsModel.fromJson(json);
}

/// @nodoc
mixin _$ContentsModel {
  @JsonKey(name: "about")
  String? get about => throw _privateConstructorUsedError;
  @JsonKey(name: "privacyPolicy")
  String? get privacyPolicy => throw _privateConstructorUsedError;
  @JsonKey(name: "privacyPolicyAr")
  String? get privacyPolicyAr => throw _privateConstructorUsedError;
  @JsonKey(name: "termsAndConditions")
  String? get termsAndConditions => throw _privateConstructorUsedError;
  @JsonKey(name: "termsAndConditionsAr")
  String? get termsAndConditionsAr => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ContentsModelCopyWith<ContentsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContentsModelCopyWith<$Res> {
  factory $ContentsModelCopyWith(
          ContentsModel value, $Res Function(ContentsModel) then) =
      _$ContentsModelCopyWithImpl<$Res, ContentsModel>;
  @useResult
  $Res call(
      {@JsonKey(name: "about") String? about,
      @JsonKey(name: "privacyPolicy") String? privacyPolicy,
      @JsonKey(name: "privacyPolicyAr") String? privacyPolicyAr,
      @JsonKey(name: "termsAndConditions") String? termsAndConditions,
      @JsonKey(name: "termsAndConditionsAr") String? termsAndConditionsAr});
}

/// @nodoc
class _$ContentsModelCopyWithImpl<$Res, $Val extends ContentsModel>
    implements $ContentsModelCopyWith<$Res> {
  _$ContentsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? about = freezed,
    Object? privacyPolicy = freezed,
    Object? privacyPolicyAr = freezed,
    Object? termsAndConditions = freezed,
    Object? termsAndConditionsAr = freezed,
  }) {
    return _then(_value.copyWith(
      about: freezed == about
          ? _value.about
          : about // ignore: cast_nullable_to_non_nullable
              as String?,
      privacyPolicy: freezed == privacyPolicy
          ? _value.privacyPolicy
          : privacyPolicy // ignore: cast_nullable_to_non_nullable
              as String?,
      privacyPolicyAr: freezed == privacyPolicyAr
          ? _value.privacyPolicyAr
          : privacyPolicyAr // ignore: cast_nullable_to_non_nullable
              as String?,
      termsAndConditions: freezed == termsAndConditions
          ? _value.termsAndConditions
          : termsAndConditions // ignore: cast_nullable_to_non_nullable
              as String?,
      termsAndConditionsAr: freezed == termsAndConditionsAr
          ? _value.termsAndConditionsAr
          : termsAndConditionsAr // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ContentsModelImplCopyWith<$Res>
    implements $ContentsModelCopyWith<$Res> {
  factory _$$ContentsModelImplCopyWith(
          _$ContentsModelImpl value, $Res Function(_$ContentsModelImpl) then) =
      __$$ContentsModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "about") String? about,
      @JsonKey(name: "privacyPolicy") String? privacyPolicy,
      @JsonKey(name: "privacyPolicyAr") String? privacyPolicyAr,
      @JsonKey(name: "termsAndConditions") String? termsAndConditions,
      @JsonKey(name: "termsAndConditionsAr") String? termsAndConditionsAr});
}

/// @nodoc
class __$$ContentsModelImplCopyWithImpl<$Res>
    extends _$ContentsModelCopyWithImpl<$Res, _$ContentsModelImpl>
    implements _$$ContentsModelImplCopyWith<$Res> {
  __$$ContentsModelImplCopyWithImpl(
      _$ContentsModelImpl _value, $Res Function(_$ContentsModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? about = freezed,
    Object? privacyPolicy = freezed,
    Object? privacyPolicyAr = freezed,
    Object? termsAndConditions = freezed,
    Object? termsAndConditionsAr = freezed,
  }) {
    return _then(_$ContentsModelImpl(
      about: freezed == about
          ? _value.about
          : about // ignore: cast_nullable_to_non_nullable
              as String?,
      privacyPolicy: freezed == privacyPolicy
          ? _value.privacyPolicy
          : privacyPolicy // ignore: cast_nullable_to_non_nullable
              as String?,
      privacyPolicyAr: freezed == privacyPolicyAr
          ? _value.privacyPolicyAr
          : privacyPolicyAr // ignore: cast_nullable_to_non_nullable
              as String?,
      termsAndConditions: freezed == termsAndConditions
          ? _value.termsAndConditions
          : termsAndConditions // ignore: cast_nullable_to_non_nullable
              as String?,
      termsAndConditionsAr: freezed == termsAndConditionsAr
          ? _value.termsAndConditionsAr
          : termsAndConditionsAr // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ContentsModelImpl implements _ContentsModel {
  const _$ContentsModelImpl(
      {@JsonKey(name: "about") this.about,
      @JsonKey(name: "privacyPolicy") this.privacyPolicy,
      @JsonKey(name: "privacyPolicyAr") this.privacyPolicyAr,
      @JsonKey(name: "termsAndConditions") this.termsAndConditions,
      @JsonKey(name: "termsAndConditionsAr") this.termsAndConditionsAr});

  factory _$ContentsModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ContentsModelImplFromJson(json);

  @override
  @JsonKey(name: "about")
  final String? about;
  @override
  @JsonKey(name: "privacyPolicy")
  final String? privacyPolicy;
  @override
  @JsonKey(name: "privacyPolicyAr")
  final String? privacyPolicyAr;
  @override
  @JsonKey(name: "termsAndConditions")
  final String? termsAndConditions;
  @override
  @JsonKey(name: "termsAndConditionsAr")
  final String? termsAndConditionsAr;

  @override
  String toString() {
    return 'ContentsModel(about: $about, privacyPolicy: $privacyPolicy, privacyPolicyAr: $privacyPolicyAr, termsAndConditions: $termsAndConditions, termsAndConditionsAr: $termsAndConditionsAr)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ContentsModelImpl &&
            (identical(other.about, about) || other.about == about) &&
            (identical(other.privacyPolicy, privacyPolicy) ||
                other.privacyPolicy == privacyPolicy) &&
            (identical(other.privacyPolicyAr, privacyPolicyAr) ||
                other.privacyPolicyAr == privacyPolicyAr) &&
            (identical(other.termsAndConditions, termsAndConditions) ||
                other.termsAndConditions == termsAndConditions) &&
            (identical(other.termsAndConditionsAr, termsAndConditionsAr) ||
                other.termsAndConditionsAr == termsAndConditionsAr));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, about, privacyPolicy,
      privacyPolicyAr, termsAndConditions, termsAndConditionsAr);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ContentsModelImplCopyWith<_$ContentsModelImpl> get copyWith =>
      __$$ContentsModelImplCopyWithImpl<_$ContentsModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ContentsModelImplToJson(
      this,
    );
  }
}

abstract class _ContentsModel implements ContentsModel {
  const factory _ContentsModel(
      {@JsonKey(name: "about") final String? about,
      @JsonKey(name: "privacyPolicy") final String? privacyPolicy,
      @JsonKey(name: "privacyPolicyAr") final String? privacyPolicyAr,
      @JsonKey(name: "termsAndConditions") final String? termsAndConditions,
      @JsonKey(name: "termsAndConditionsAr")
      final String? termsAndConditionsAr}) = _$ContentsModelImpl;

  factory _ContentsModel.fromJson(Map<String, dynamic> json) =
      _$ContentsModelImpl.fromJson;

  @override
  @JsonKey(name: "about")
  String? get about;
  @override
  @JsonKey(name: "privacyPolicy")
  String? get privacyPolicy;
  @override
  @JsonKey(name: "privacyPolicyAr")
  String? get privacyPolicyAr;
  @override
  @JsonKey(name: "termsAndConditions")
  String? get termsAndConditions;
  @override
  @JsonKey(name: "termsAndConditionsAr")
  String? get termsAndConditionsAr;
  @override
  @JsonKey(ignore: true)
  _$$ContentsModelImplCopyWith<_$ContentsModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
