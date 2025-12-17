// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserAdapter extends TypeAdapter<User> {
  @override
  final int typeId = 0;

  @override
  User read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return User(
      id: fields[0] as int?,
      name: fields[2] as String?,
      mobile: fields[3] as String?,
      email: fields[4] as String?,
      age: fields[5] as String?,
      profession: fields[6] as String?,
      introduce: fields[7] as String?,
      address: fields[8] as String?,
      dateOfBirth: fields[9] as DateTime?,
      rating: fields[10] as String?,
      image: fields[11] as String?,
      createdDate: fields[12] as DateTime?,
    );
  }

  @override
  void write(BinaryWriter writer, User obj) {
    writer
      ..writeByte(12)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.mobile)
      ..writeByte(4)
      ..write(obj.email)
      ..writeByte(5)
      ..write(obj.age)
      ..writeByte(6)
      ..write(obj.profession)
      ..writeByte(7)
      ..write(obj.introduce)
      ..writeByte(8)
      ..write(obj.address)
      ..writeByte(9)
      ..write(obj.dateOfBirth)
      ..writeByte(10)
      ..write(obj.rating)
      ..writeByte(11)
      ..write(obj.image)
      ..writeByte(12)
      ..write(obj.createdDate);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserModelImpl _$$UserModelImplFromJson(Map<String, dynamic> json) =>
    _$UserModelImpl(
      status: json['status'] as bool?,
      token: json['token'] as String?,
      message: json['message'] as String?,
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$UserModelImplToJson(_$UserModelImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'token': instance.token,
      'message': instance.message,
      'user': instance.user,
    };

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      mobile: json['mobile'] as String?,
      email: json['email'] as String?,
      age: json['age'] as String?,
      profession: json['profession'] as String?,
      introduce: json['introduce'] as String?,
      address: json['address'] as String?,
      dateOfBirth: json['dateOfBirth'] == null
          ? null
          : DateTime.parse(json['dateOfBirth'] as String),
      rating: json['raring'] as String?,
      image: json['image'] as String?,
      createdDate: json['createdDate'] == null
          ? null
          : DateTime.parse(json['createdDate'] as String),
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'mobile': instance.mobile,
      'email': instance.email,
      'age': instance.age,
      'profession': instance.profession,
      'introduce': instance.introduce,
      'address': instance.address,
      'dateOfBirth': instance.dateOfBirth?.toIso8601String(),
      'raring': instance.rating,
      'image': instance.image,
      'createdDate': instance.createdDate?.toIso8601String(),
    };
