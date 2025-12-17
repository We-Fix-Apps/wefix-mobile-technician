// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserModel _$UserModelFromJson(Map<String, dynamic> json) {
  return _UserModel.fromJson(json);
}

/// @nodoc
mixin _$UserModel {
  @JsonKey(name: "status")
  bool? get status => throw _privateConstructorUsedError;
  @JsonKey(name: "token")
  String? get token => throw _privateConstructorUsedError;
  @JsonKey(name: "message")
  String? get message => throw _privateConstructorUsedError;
  @JsonKey(name: "user")
  User? get user => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserModelCopyWith<UserModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserModelCopyWith<$Res> {
  factory $UserModelCopyWith(UserModel value, $Res Function(UserModel) then) =
      _$UserModelCopyWithImpl<$Res, UserModel>;
  @useResult
  $Res call(
      {@JsonKey(name: "status") bool? status,
      @JsonKey(name: "token") String? token,
      @JsonKey(name: "message") String? message,
      @JsonKey(name: "user") User? user});

  $UserCopyWith<$Res>? get user;
}

/// @nodoc
class _$UserModelCopyWithImpl<$Res, $Val extends UserModel>
    implements $UserModelCopyWith<$Res> {
  _$UserModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? token = freezed,
    Object? message = freezed,
    Object? user = freezed,
  }) {
    return _then(_value.copyWith(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool?,
      token: freezed == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $UserCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UserModelImplCopyWith<$Res>
    implements $UserModelCopyWith<$Res> {
  factory _$$UserModelImplCopyWith(
          _$UserModelImpl value, $Res Function(_$UserModelImpl) then) =
      __$$UserModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "status") bool? status,
      @JsonKey(name: "token") String? token,
      @JsonKey(name: "message") String? message,
      @JsonKey(name: "user") User? user});

  @override
  $UserCopyWith<$Res>? get user;
}

/// @nodoc
class __$$UserModelImplCopyWithImpl<$Res>
    extends _$UserModelCopyWithImpl<$Res, _$UserModelImpl>
    implements _$$UserModelImplCopyWith<$Res> {
  __$$UserModelImplCopyWithImpl(
      _$UserModelImpl _value, $Res Function(_$UserModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? token = freezed,
    Object? message = freezed,
    Object? user = freezed,
  }) {
    return _then(_$UserModelImpl(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool?,
      token: freezed == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserModelImpl implements _UserModel {
  const _$UserModelImpl(
      {@JsonKey(name: "status") this.status,
      @JsonKey(name: "token") this.token,
      @JsonKey(name: "message") this.message,
      @JsonKey(name: "user") this.user});

  factory _$UserModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserModelImplFromJson(json);

  @override
  @JsonKey(name: "status")
  final bool? status;
  @override
  @JsonKey(name: "token")
  final String? token;
  @override
  @JsonKey(name: "message")
  final String? message;
  @override
  @JsonKey(name: "user")
  final User? user;

  @override
  String toString() {
    return 'UserModel(status: $status, token: $token, message: $message, user: $user)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserModelImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.token, token) || other.token == token) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.user, user) || other.user == user));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, status, token, message, user);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserModelImplCopyWith<_$UserModelImpl> get copyWith =>
      __$$UserModelImplCopyWithImpl<_$UserModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserModelImplToJson(
      this,
    );
  }
}

abstract class _UserModel implements UserModel {
  const factory _UserModel(
      {@JsonKey(name: "status") final bool? status,
      @JsonKey(name: "token") final String? token,
      @JsonKey(name: "message") final String? message,
      @JsonKey(name: "user") final User? user}) = _$UserModelImpl;

  factory _UserModel.fromJson(Map<String, dynamic> json) =
      _$UserModelImpl.fromJson;

  @override
  @JsonKey(name: "status")
  bool? get status;
  @override
  @JsonKey(name: "token")
  String? get token;
  @override
  @JsonKey(name: "message")
  String? get message;
  @override
  @JsonKey(name: "user")
  User? get user;
  @override
  @JsonKey(ignore: true)
  _$$UserModelImplCopyWith<_$UserModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

User _$UserFromJson(Map<String, dynamic> json) {
  return _User.fromJson(json);
}

/// @nodoc
mixin _$User {
  @HiveField(0)
  @JsonKey(name: "id")
  int? get id => throw _privateConstructorUsedError;
  @HiveField(2)
  @JsonKey(name: "name")
  String? get name => throw _privateConstructorUsedError;
  @HiveField(3)
  @JsonKey(name: "mobile")
  String? get mobile => throw _privateConstructorUsedError;
  @HiveField(4)
  @JsonKey(name: "email")
  String? get email => throw _privateConstructorUsedError;
  @HiveField(5)
  @JsonKey(name: "age")
  String? get age => throw _privateConstructorUsedError;
  @HiveField(6)
  @JsonKey(name: "profession")
  String? get profession => throw _privateConstructorUsedError;
  @HiveField(7)
  @JsonKey(name: "introduce")
  String? get introduce => throw _privateConstructorUsedError;
  @HiveField(8)
  @JsonKey(name: "address")
  String? get address => throw _privateConstructorUsedError;
  @HiveField(9)
  @JsonKey(name: "dateOfBirth")
  DateTime? get dateOfBirth => throw _privateConstructorUsedError;
  @HiveField(10)
  @JsonKey(name: "raring")
  String? get rating => throw _privateConstructorUsedError;
  @HiveField(11)
  @JsonKey(name: "image")
  String? get image => throw _privateConstructorUsedError;
  @HiveField(12)
  @JsonKey(name: "createdDate")
  DateTime? get createdDate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserCopyWith<User> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res, User>;
  @useResult
  $Res call(
      {@HiveField(0) @JsonKey(name: "id") int? id,
      @HiveField(2) @JsonKey(name: "name") String? name,
      @HiveField(3) @JsonKey(name: "mobile") String? mobile,
      @HiveField(4) @JsonKey(name: "email") String? email,
      @HiveField(5) @JsonKey(name: "age") String? age,
      @HiveField(6) @JsonKey(name: "profession") String? profession,
      @HiveField(7) @JsonKey(name: "introduce") String? introduce,
      @HiveField(8) @JsonKey(name: "address") String? address,
      @HiveField(9) @JsonKey(name: "dateOfBirth") DateTime? dateOfBirth,
      @HiveField(10) @JsonKey(name: "raring") String? rating,
      @HiveField(11) @JsonKey(name: "image") String? image,
      @HiveField(12) @JsonKey(name: "createdDate") DateTime? createdDate});
}

/// @nodoc
class _$UserCopyWithImpl<$Res, $Val extends User>
    implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? mobile = freezed,
    Object? email = freezed,
    Object? age = freezed,
    Object? profession = freezed,
    Object? introduce = freezed,
    Object? address = freezed,
    Object? dateOfBirth = freezed,
    Object? rating = freezed,
    Object? image = freezed,
    Object? createdDate = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      mobile: freezed == mobile
          ? _value.mobile
          : mobile // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      age: freezed == age
          ? _value.age
          : age // ignore: cast_nullable_to_non_nullable
              as String?,
      profession: freezed == profession
          ? _value.profession
          : profession // ignore: cast_nullable_to_non_nullable
              as String?,
      introduce: freezed == introduce
          ? _value.introduce
          : introduce // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      dateOfBirth: freezed == dateOfBirth
          ? _value.dateOfBirth
          : dateOfBirth // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      rating: freezed == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      createdDate: freezed == createdDate
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserImplCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$$UserImplCopyWith(
          _$UserImpl value, $Res Function(_$UserImpl) then) =
      __$$UserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) @JsonKey(name: "id") int? id,
      @HiveField(2) @JsonKey(name: "name") String? name,
      @HiveField(3) @JsonKey(name: "mobile") String? mobile,
      @HiveField(4) @JsonKey(name: "email") String? email,
      @HiveField(5) @JsonKey(name: "age") String? age,
      @HiveField(6) @JsonKey(name: "profession") String? profession,
      @HiveField(7) @JsonKey(name: "introduce") String? introduce,
      @HiveField(8) @JsonKey(name: "address") String? address,
      @HiveField(9) @JsonKey(name: "dateOfBirth") DateTime? dateOfBirth,
      @HiveField(10) @JsonKey(name: "raring") String? rating,
      @HiveField(11) @JsonKey(name: "image") String? image,
      @HiveField(12) @JsonKey(name: "createdDate") DateTime? createdDate});
}

/// @nodoc
class __$$UserImplCopyWithImpl<$Res>
    extends _$UserCopyWithImpl<$Res, _$UserImpl>
    implements _$$UserImplCopyWith<$Res> {
  __$$UserImplCopyWithImpl(_$UserImpl _value, $Res Function(_$UserImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? mobile = freezed,
    Object? email = freezed,
    Object? age = freezed,
    Object? profession = freezed,
    Object? introduce = freezed,
    Object? address = freezed,
    Object? dateOfBirth = freezed,
    Object? rating = freezed,
    Object? image = freezed,
    Object? createdDate = freezed,
  }) {
    return _then(_$UserImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      mobile: freezed == mobile
          ? _value.mobile
          : mobile // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      age: freezed == age
          ? _value.age
          : age // ignore: cast_nullable_to_non_nullable
              as String?,
      profession: freezed == profession
          ? _value.profession
          : profession // ignore: cast_nullable_to_non_nullable
              as String?,
      introduce: freezed == introduce
          ? _value.introduce
          : introduce // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      dateOfBirth: freezed == dateOfBirth
          ? _value.dateOfBirth
          : dateOfBirth // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      rating: freezed == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      createdDate: freezed == createdDate
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserImpl implements _User {
  const _$UserImpl(
      {@HiveField(0) @JsonKey(name: "id") this.id,
      @HiveField(2) @JsonKey(name: "name") this.name,
      @HiveField(3) @JsonKey(name: "mobile") this.mobile,
      @HiveField(4) @JsonKey(name: "email") this.email,
      @HiveField(5) @JsonKey(name: "age") this.age,
      @HiveField(6) @JsonKey(name: "profession") this.profession,
      @HiveField(7) @JsonKey(name: "introduce") this.introduce,
      @HiveField(8) @JsonKey(name: "address") this.address,
      @HiveField(9) @JsonKey(name: "dateOfBirth") this.dateOfBirth,
      @HiveField(10) @JsonKey(name: "raring") this.rating,
      @HiveField(11) @JsonKey(name: "image") this.image,
      @HiveField(12) @JsonKey(name: "createdDate") this.createdDate});

  factory _$UserImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserImplFromJson(json);

  @override
  @HiveField(0)
  @JsonKey(name: "id")
  final int? id;
  @override
  @HiveField(2)
  @JsonKey(name: "name")
  final String? name;
  @override
  @HiveField(3)
  @JsonKey(name: "mobile")
  final String? mobile;
  @override
  @HiveField(4)
  @JsonKey(name: "email")
  final String? email;
  @override
  @HiveField(5)
  @JsonKey(name: "age")
  final String? age;
  @override
  @HiveField(6)
  @JsonKey(name: "profession")
  final String? profession;
  @override
  @HiveField(7)
  @JsonKey(name: "introduce")
  final String? introduce;
  @override
  @HiveField(8)
  @JsonKey(name: "address")
  final String? address;
  @override
  @HiveField(9)
  @JsonKey(name: "dateOfBirth")
  final DateTime? dateOfBirth;
  @override
  @HiveField(10)
  @JsonKey(name: "raring")
  final String? rating;
  @override
  @HiveField(11)
  @JsonKey(name: "image")
  final String? image;
  @override
  @HiveField(12)
  @JsonKey(name: "createdDate")
  final DateTime? createdDate;

  @override
  String toString() {
    return 'User(id: $id, name: $name, mobile: $mobile, email: $email, age: $age, profession: $profession, introduce: $introduce, address: $address, dateOfBirth: $dateOfBirth, rating: $rating, image: $image, createdDate: $createdDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.mobile, mobile) || other.mobile == mobile) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.age, age) || other.age == age) &&
            (identical(other.profession, profession) ||
                other.profession == profession) &&
            (identical(other.introduce, introduce) ||
                other.introduce == introduce) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.dateOfBirth, dateOfBirth) ||
                other.dateOfBirth == dateOfBirth) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.createdDate, createdDate) ||
                other.createdDate == createdDate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, mobile, email, age,
      profession, introduce, address, dateOfBirth, rating, image, createdDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserImplCopyWith<_$UserImpl> get copyWith =>
      __$$UserImplCopyWithImpl<_$UserImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserImplToJson(
      this,
    );
  }
}

abstract class _User implements User {
  const factory _User(
      {@HiveField(0) @JsonKey(name: "id") final int? id,
      @HiveField(2) @JsonKey(name: "name") final String? name,
      @HiveField(3) @JsonKey(name: "mobile") final String? mobile,
      @HiveField(4) @JsonKey(name: "email") final String? email,
      @HiveField(5) @JsonKey(name: "age") final String? age,
      @HiveField(6) @JsonKey(name: "profession") final String? profession,
      @HiveField(7) @JsonKey(name: "introduce") final String? introduce,
      @HiveField(8) @JsonKey(name: "address") final String? address,
      @HiveField(9) @JsonKey(name: "dateOfBirth") final DateTime? dateOfBirth,
      @HiveField(10) @JsonKey(name: "raring") final String? rating,
      @HiveField(11) @JsonKey(name: "image") final String? image,
      @HiveField(12)
      @JsonKey(name: "createdDate")
      final DateTime? createdDate}) = _$UserImpl;

  factory _User.fromJson(Map<String, dynamic> json) = _$UserImpl.fromJson;

  @override
  @HiveField(0)
  @JsonKey(name: "id")
  int? get id;
  @override
  @HiveField(2)
  @JsonKey(name: "name")
  String? get name;
  @override
  @HiveField(3)
  @JsonKey(name: "mobile")
  String? get mobile;
  @override
  @HiveField(4)
  @JsonKey(name: "email")
  String? get email;
  @override
  @HiveField(5)
  @JsonKey(name: "age")
  String? get age;
  @override
  @HiveField(6)
  @JsonKey(name: "profession")
  String? get profession;
  @override
  @HiveField(7)
  @JsonKey(name: "introduce")
  String? get introduce;
  @override
  @HiveField(8)
  @JsonKey(name: "address")
  String? get address;
  @override
  @HiveField(9)
  @JsonKey(name: "dateOfBirth")
  DateTime? get dateOfBirth;
  @override
  @HiveField(10)
  @JsonKey(name: "raring")
  String? get rating;
  @override
  @HiveField(11)
  @JsonKey(name: "image")
  String? get image;
  @override
  @HiveField(12)
  @JsonKey(name: "createdDate")
  DateTime? get createdDate;
  @override
  @JsonKey(ignore: true)
  _$$UserImplCopyWith<_$UserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
