// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'contact_info_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ContactInfoModel _$ContactInfoModelFromJson(Map<String, dynamic> json) {
  return _ContactInfoModel.fromJson(json);
}

/// @nodoc
mixin _$ContactInfoModel {
  @JsonKey(name: "languages")
  ContactInfo? get languages => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ContactInfoModelCopyWith<ContactInfoModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContactInfoModelCopyWith<$Res> {
  factory $ContactInfoModelCopyWith(
          ContactInfoModel value, $Res Function(ContactInfoModel) then) =
      _$ContactInfoModelCopyWithImpl<$Res, ContactInfoModel>;
  @useResult
  $Res call({@JsonKey(name: "languages") ContactInfo? languages});

  $ContactInfoCopyWith<$Res>? get languages;
}

/// @nodoc
class _$ContactInfoModelCopyWithImpl<$Res, $Val extends ContactInfoModel>
    implements $ContactInfoModelCopyWith<$Res> {
  _$ContactInfoModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? languages = freezed,
  }) {
    return _then(_value.copyWith(
      languages: freezed == languages
          ? _value.languages
          : languages // ignore: cast_nullable_to_non_nullable
              as ContactInfo?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ContactInfoCopyWith<$Res>? get languages {
    if (_value.languages == null) {
      return null;
    }

    return $ContactInfoCopyWith<$Res>(_value.languages!, (value) {
      return _then(_value.copyWith(languages: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ContactInfoModelImplCopyWith<$Res>
    implements $ContactInfoModelCopyWith<$Res> {
  factory _$$ContactInfoModelImplCopyWith(_$ContactInfoModelImpl value,
          $Res Function(_$ContactInfoModelImpl) then) =
      __$$ContactInfoModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: "languages") ContactInfo? languages});

  @override
  $ContactInfoCopyWith<$Res>? get languages;
}

/// @nodoc
class __$$ContactInfoModelImplCopyWithImpl<$Res>
    extends _$ContactInfoModelCopyWithImpl<$Res, _$ContactInfoModelImpl>
    implements _$$ContactInfoModelImplCopyWith<$Res> {
  __$$ContactInfoModelImplCopyWithImpl(_$ContactInfoModelImpl _value,
      $Res Function(_$ContactInfoModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? languages = freezed,
  }) {
    return _then(_$ContactInfoModelImpl(
      languages: freezed == languages
          ? _value.languages
          : languages // ignore: cast_nullable_to_non_nullable
              as ContactInfo?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ContactInfoModelImpl implements _ContactInfoModel {
  const _$ContactInfoModelImpl({@JsonKey(name: "languages") this.languages});

  factory _$ContactInfoModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ContactInfoModelImplFromJson(json);

  @override
  @JsonKey(name: "languages")
  final ContactInfo? languages;

  @override
  String toString() {
    return 'ContactInfoModel(languages: $languages)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ContactInfoModelImpl &&
            (identical(other.languages, languages) ||
                other.languages == languages));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, languages);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ContactInfoModelImplCopyWith<_$ContactInfoModelImpl> get copyWith =>
      __$$ContactInfoModelImplCopyWithImpl<_$ContactInfoModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ContactInfoModelImplToJson(
      this,
    );
  }
}

abstract class _ContactInfoModel implements ContactInfoModel {
  const factory _ContactInfoModel(
          {@JsonKey(name: "languages") final ContactInfo? languages}) =
      _$ContactInfoModelImpl;

  factory _ContactInfoModel.fromJson(Map<String, dynamic> json) =
      _$ContactInfoModelImpl.fromJson;

  @override
  @JsonKey(name: "languages")
  ContactInfo? get languages;
  @override
  @JsonKey(ignore: true)
  _$$ContactInfoModelImplCopyWith<_$ContactInfoModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ContactInfo _$ContactInfoFromJson(Map<String, dynamic> json) {
  return _ContactInfo.fromJson(json);
}

/// @nodoc
mixin _$ContactInfo {
  @JsonKey(name: "id")
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: "phone")
  String? get phone => throw _privateConstructorUsedError;
  @JsonKey(name: "emegancyPhone")
  String? get emegancyPhone => throw _privateConstructorUsedError;
  @JsonKey(name: "email")
  String? get email => throw _privateConstructorUsedError;
  @JsonKey(name: "longitude")
  String? get longitude => throw _privateConstructorUsedError;
  @JsonKey(name: "latitude")
  String? get latitude => throw _privateConstructorUsedError;
  @JsonKey(name: "facebook")
  String? get facebook => throw _privateConstructorUsedError;
  @JsonKey(name: "linkedin")
  String? get linkedin => throw _privateConstructorUsedError;
  @JsonKey(name: "twitter")
  String? get twitter => throw _privateConstructorUsedError;
  @JsonKey(name: "instagram")
  String? get instagram => throw _privateConstructorUsedError;
  @JsonKey(name: "youtube")
  String? get youtube => throw _privateConstructorUsedError;
  @JsonKey(name: "whatsapp")
  String? get whatsapp => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ContactInfoCopyWith<ContactInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContactInfoCopyWith<$Res> {
  factory $ContactInfoCopyWith(
          ContactInfo value, $Res Function(ContactInfo) then) =
      _$ContactInfoCopyWithImpl<$Res, ContactInfo>;
  @useResult
  $Res call(
      {@JsonKey(name: "id") int? id,
      @JsonKey(name: "phone") String? phone,
      @JsonKey(name: "emegancyPhone") String? emegancyPhone,
      @JsonKey(name: "email") String? email,
      @JsonKey(name: "longitude") String? longitude,
      @JsonKey(name: "latitude") String? latitude,
      @JsonKey(name: "facebook") String? facebook,
      @JsonKey(name: "linkedin") String? linkedin,
      @JsonKey(name: "twitter") String? twitter,
      @JsonKey(name: "instagram") String? instagram,
      @JsonKey(name: "youtube") String? youtube,
      @JsonKey(name: "whatsapp") String? whatsapp});
}

/// @nodoc
class _$ContactInfoCopyWithImpl<$Res, $Val extends ContactInfo>
    implements $ContactInfoCopyWith<$Res> {
  _$ContactInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? phone = freezed,
    Object? emegancyPhone = freezed,
    Object? email = freezed,
    Object? longitude = freezed,
    Object? latitude = freezed,
    Object? facebook = freezed,
    Object? linkedin = freezed,
    Object? twitter = freezed,
    Object? instagram = freezed,
    Object? youtube = freezed,
    Object? whatsapp = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      emegancyPhone: freezed == emegancyPhone
          ? _value.emegancyPhone
          : emegancyPhone // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      longitude: freezed == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as String?,
      latitude: freezed == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as String?,
      facebook: freezed == facebook
          ? _value.facebook
          : facebook // ignore: cast_nullable_to_non_nullable
              as String?,
      linkedin: freezed == linkedin
          ? _value.linkedin
          : linkedin // ignore: cast_nullable_to_non_nullable
              as String?,
      twitter: freezed == twitter
          ? _value.twitter
          : twitter // ignore: cast_nullable_to_non_nullable
              as String?,
      instagram: freezed == instagram
          ? _value.instagram
          : instagram // ignore: cast_nullable_to_non_nullable
              as String?,
      youtube: freezed == youtube
          ? _value.youtube
          : youtube // ignore: cast_nullable_to_non_nullable
              as String?,
      whatsapp: freezed == whatsapp
          ? _value.whatsapp
          : whatsapp // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ContactInfoImplCopyWith<$Res>
    implements $ContactInfoCopyWith<$Res> {
  factory _$$ContactInfoImplCopyWith(
          _$ContactInfoImpl value, $Res Function(_$ContactInfoImpl) then) =
      __$$ContactInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "id") int? id,
      @JsonKey(name: "phone") String? phone,
      @JsonKey(name: "emegancyPhone") String? emegancyPhone,
      @JsonKey(name: "email") String? email,
      @JsonKey(name: "longitude") String? longitude,
      @JsonKey(name: "latitude") String? latitude,
      @JsonKey(name: "facebook") String? facebook,
      @JsonKey(name: "linkedin") String? linkedin,
      @JsonKey(name: "twitter") String? twitter,
      @JsonKey(name: "instagram") String? instagram,
      @JsonKey(name: "youtube") String? youtube,
      @JsonKey(name: "whatsapp") String? whatsapp});
}

/// @nodoc
class __$$ContactInfoImplCopyWithImpl<$Res>
    extends _$ContactInfoCopyWithImpl<$Res, _$ContactInfoImpl>
    implements _$$ContactInfoImplCopyWith<$Res> {
  __$$ContactInfoImplCopyWithImpl(
      _$ContactInfoImpl _value, $Res Function(_$ContactInfoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? phone = freezed,
    Object? emegancyPhone = freezed,
    Object? email = freezed,
    Object? longitude = freezed,
    Object? latitude = freezed,
    Object? facebook = freezed,
    Object? linkedin = freezed,
    Object? twitter = freezed,
    Object? instagram = freezed,
    Object? youtube = freezed,
    Object? whatsapp = freezed,
  }) {
    return _then(_$ContactInfoImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      emegancyPhone: freezed == emegancyPhone
          ? _value.emegancyPhone
          : emegancyPhone // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      longitude: freezed == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as String?,
      latitude: freezed == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as String?,
      facebook: freezed == facebook
          ? _value.facebook
          : facebook // ignore: cast_nullable_to_non_nullable
              as String?,
      linkedin: freezed == linkedin
          ? _value.linkedin
          : linkedin // ignore: cast_nullable_to_non_nullable
              as String?,
      twitter: freezed == twitter
          ? _value.twitter
          : twitter // ignore: cast_nullable_to_non_nullable
              as String?,
      instagram: freezed == instagram
          ? _value.instagram
          : instagram // ignore: cast_nullable_to_non_nullable
              as String?,
      youtube: freezed == youtube
          ? _value.youtube
          : youtube // ignore: cast_nullable_to_non_nullable
              as String?,
      whatsapp: freezed == whatsapp
          ? _value.whatsapp
          : whatsapp // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ContactInfoImpl implements _ContactInfo {
  const _$ContactInfoImpl(
      {@JsonKey(name: "id") this.id,
      @JsonKey(name: "phone") this.phone,
      @JsonKey(name: "emegancyPhone") this.emegancyPhone,
      @JsonKey(name: "email") this.email,
      @JsonKey(name: "longitude") this.longitude,
      @JsonKey(name: "latitude") this.latitude,
      @JsonKey(name: "facebook") this.facebook,
      @JsonKey(name: "linkedin") this.linkedin,
      @JsonKey(name: "twitter") this.twitter,
      @JsonKey(name: "instagram") this.instagram,
      @JsonKey(name: "youtube") this.youtube,
      @JsonKey(name: "whatsapp") this.whatsapp});

  factory _$ContactInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$ContactInfoImplFromJson(json);

  @override
  @JsonKey(name: "id")
  final int? id;
  @override
  @JsonKey(name: "phone")
  final String? phone;
  @override
  @JsonKey(name: "emegancyPhone")
  final String? emegancyPhone;
  @override
  @JsonKey(name: "email")
  final String? email;
  @override
  @JsonKey(name: "longitude")
  final String? longitude;
  @override
  @JsonKey(name: "latitude")
  final String? latitude;
  @override
  @JsonKey(name: "facebook")
  final String? facebook;
  @override
  @JsonKey(name: "linkedin")
  final String? linkedin;
  @override
  @JsonKey(name: "twitter")
  final String? twitter;
  @override
  @JsonKey(name: "instagram")
  final String? instagram;
  @override
  @JsonKey(name: "youtube")
  final String? youtube;
  @override
  @JsonKey(name: "whatsapp")
  final String? whatsapp;

  @override
  String toString() {
    return 'ContactInfo(id: $id, phone: $phone, emegancyPhone: $emegancyPhone, email: $email, longitude: $longitude, latitude: $latitude, facebook: $facebook, linkedin: $linkedin, twitter: $twitter, instagram: $instagram, youtube: $youtube, whatsapp: $whatsapp)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ContactInfoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.emegancyPhone, emegancyPhone) ||
                other.emegancyPhone == emegancyPhone) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.facebook, facebook) ||
                other.facebook == facebook) &&
            (identical(other.linkedin, linkedin) ||
                other.linkedin == linkedin) &&
            (identical(other.twitter, twitter) || other.twitter == twitter) &&
            (identical(other.instagram, instagram) ||
                other.instagram == instagram) &&
            (identical(other.youtube, youtube) || other.youtube == youtube) &&
            (identical(other.whatsapp, whatsapp) ||
                other.whatsapp == whatsapp));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      phone,
      emegancyPhone,
      email,
      longitude,
      latitude,
      facebook,
      linkedin,
      twitter,
      instagram,
      youtube,
      whatsapp);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ContactInfoImplCopyWith<_$ContactInfoImpl> get copyWith =>
      __$$ContactInfoImplCopyWithImpl<_$ContactInfoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ContactInfoImplToJson(
      this,
    );
  }
}

abstract class _ContactInfo implements ContactInfo {
  const factory _ContactInfo(
      {@JsonKey(name: "id") final int? id,
      @JsonKey(name: "phone") final String? phone,
      @JsonKey(name: "emegancyPhone") final String? emegancyPhone,
      @JsonKey(name: "email") final String? email,
      @JsonKey(name: "longitude") final String? longitude,
      @JsonKey(name: "latitude") final String? latitude,
      @JsonKey(name: "facebook") final String? facebook,
      @JsonKey(name: "linkedin") final String? linkedin,
      @JsonKey(name: "twitter") final String? twitter,
      @JsonKey(name: "instagram") final String? instagram,
      @JsonKey(name: "youtube") final String? youtube,
      @JsonKey(name: "whatsapp") final String? whatsapp}) = _$ContactInfoImpl;

  factory _ContactInfo.fromJson(Map<String, dynamic> json) =
      _$ContactInfoImpl.fromJson;

  @override
  @JsonKey(name: "id")
  int? get id;
  @override
  @JsonKey(name: "phone")
  String? get phone;
  @override
  @JsonKey(name: "emegancyPhone")
  String? get emegancyPhone;
  @override
  @JsonKey(name: "email")
  String? get email;
  @override
  @JsonKey(name: "longitude")
  String? get longitude;
  @override
  @JsonKey(name: "latitude")
  String? get latitude;
  @override
  @JsonKey(name: "facebook")
  String? get facebook;
  @override
  @JsonKey(name: "linkedin")
  String? get linkedin;
  @override
  @JsonKey(name: "twitter")
  String? get twitter;
  @override
  @JsonKey(name: "instagram")
  String? get instagram;
  @override
  @JsonKey(name: "youtube")
  String? get youtube;
  @override
  @JsonKey(name: "whatsapp")
  String? get whatsapp;
  @override
  @JsonKey(ignore: true)
  _$$ContactInfoImplCopyWith<_$ContactInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
