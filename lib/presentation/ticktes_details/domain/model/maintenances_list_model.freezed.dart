// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'maintenances_list_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MaintenancesListModel _$MaintenancesListModelFromJson(
    Map<String, dynamic> json) {
  return _MaintenancesListModel.fromJson(json);
}

/// @nodoc
mixin _$MaintenancesListModel {
  @JsonKey(name: "maintenancesList")
  List<MaintenancesList>? get maintenancesList =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MaintenancesListModelCopyWith<MaintenancesListModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MaintenancesListModelCopyWith<$Res> {
  factory $MaintenancesListModelCopyWith(MaintenancesListModel value,
          $Res Function(MaintenancesListModel) then) =
      _$MaintenancesListModelCopyWithImpl<$Res, MaintenancesListModel>;
  @useResult
  $Res call(
      {@JsonKey(name: "maintenancesList")
      List<MaintenancesList>? maintenancesList});
}

/// @nodoc
class _$MaintenancesListModelCopyWithImpl<$Res,
        $Val extends MaintenancesListModel>
    implements $MaintenancesListModelCopyWith<$Res> {
  _$MaintenancesListModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? maintenancesList = freezed,
  }) {
    return _then(_value.copyWith(
      maintenancesList: freezed == maintenancesList
          ? _value.maintenancesList
          : maintenancesList // ignore: cast_nullable_to_non_nullable
              as List<MaintenancesList>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MaintenancesListModelImplCopyWith<$Res>
    implements $MaintenancesListModelCopyWith<$Res> {
  factory _$$MaintenancesListModelImplCopyWith(
          _$MaintenancesListModelImpl value,
          $Res Function(_$MaintenancesListModelImpl) then) =
      __$$MaintenancesListModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "maintenancesList")
      List<MaintenancesList>? maintenancesList});
}

/// @nodoc
class __$$MaintenancesListModelImplCopyWithImpl<$Res>
    extends _$MaintenancesListModelCopyWithImpl<$Res,
        _$MaintenancesListModelImpl>
    implements _$$MaintenancesListModelImplCopyWith<$Res> {
  __$$MaintenancesListModelImplCopyWithImpl(_$MaintenancesListModelImpl _value,
      $Res Function(_$MaintenancesListModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? maintenancesList = freezed,
  }) {
    return _then(_$MaintenancesListModelImpl(
      maintenancesList: freezed == maintenancesList
          ? _value._maintenancesList
          : maintenancesList // ignore: cast_nullable_to_non_nullable
              as List<MaintenancesList>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MaintenancesListModelImpl implements _MaintenancesListModel {
  const _$MaintenancesListModelImpl(
      {@JsonKey(name: "maintenancesList")
      final List<MaintenancesList>? maintenancesList})
      : _maintenancesList = maintenancesList;

  factory _$MaintenancesListModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$MaintenancesListModelImplFromJson(json);

  final List<MaintenancesList>? _maintenancesList;
  @override
  @JsonKey(name: "maintenancesList")
  List<MaintenancesList>? get maintenancesList {
    final value = _maintenancesList;
    if (value == null) return null;
    if (_maintenancesList is EqualUnmodifiableListView)
      return _maintenancesList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'MaintenancesListModel(maintenancesList: $maintenancesList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MaintenancesListModelImpl &&
            const DeepCollectionEquality()
                .equals(other._maintenancesList, _maintenancesList));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_maintenancesList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MaintenancesListModelImplCopyWith<_$MaintenancesListModelImpl>
      get copyWith => __$$MaintenancesListModelImplCopyWithImpl<
          _$MaintenancesListModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MaintenancesListModelImplToJson(
      this,
    );
  }
}

abstract class _MaintenancesListModel implements MaintenancesListModel {
  const factory _MaintenancesListModel(
          {@JsonKey(name: "maintenancesList")
          final List<MaintenancesList>? maintenancesList}) =
      _$MaintenancesListModelImpl;

  factory _MaintenancesListModel.fromJson(Map<String, dynamic> json) =
      _$MaintenancesListModelImpl.fromJson;

  @override
  @JsonKey(name: "maintenancesList")
  List<MaintenancesList>? get maintenancesList;
  @override
  @JsonKey(ignore: true)
  _$$MaintenancesListModelImplCopyWith<_$MaintenancesListModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

SubMaintenance _$SubMaintenanceFromJson(Map<String, dynamic> json) {
  return _SubMaintenance.fromJson(json);
}

/// @nodoc
mixin _$SubMaintenance {
  @JsonKey(name: "id")
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: "packageTypeId")
  int? get packageTypeId => throw _privateConstructorUsedError;
  @JsonKey(name: "parentId")
  int? get parentId => throw _privateConstructorUsedError;
  @JsonKey(name: "name")
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: "nameRoom")
  String? get nameRoom => throw _privateConstructorUsedError;
  @JsonKey(name: "nameAr")
  String? get nameAr => throw _privateConstructorUsedError;
  @JsonKey(name: "icon")
  dynamic get icon => throw _privateConstructorUsedError;
  @JsonKey(name: "isChecked")
  bool? get isChecked => throw _privateConstructorUsedError;
  @JsonKey(name: "description")
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(name: "subSubMaintenances")
  List<MaintenancesList>? get subSubMaintenances =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SubMaintenanceCopyWith<SubMaintenance> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubMaintenanceCopyWith<$Res> {
  factory $SubMaintenanceCopyWith(
          SubMaintenance value, $Res Function(SubMaintenance) then) =
      _$SubMaintenanceCopyWithImpl<$Res, SubMaintenance>;
  @useResult
  $Res call(
      {@JsonKey(name: "id") int? id,
      @JsonKey(name: "packageTypeId") int? packageTypeId,
      @JsonKey(name: "parentId") int? parentId,
      @JsonKey(name: "name") String? name,
      @JsonKey(name: "nameRoom") String? nameRoom,
      @JsonKey(name: "nameAr") String? nameAr,
      @JsonKey(name: "icon") dynamic icon,
      @JsonKey(name: "isChecked") bool? isChecked,
      @JsonKey(name: "description") String? description,
      @JsonKey(name: "subSubMaintenances")
      List<MaintenancesList>? subSubMaintenances});
}

/// @nodoc
class _$SubMaintenanceCopyWithImpl<$Res, $Val extends SubMaintenance>
    implements $SubMaintenanceCopyWith<$Res> {
  _$SubMaintenanceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? packageTypeId = freezed,
    Object? parentId = freezed,
    Object? name = freezed,
    Object? nameRoom = freezed,
    Object? nameAr = freezed,
    Object? icon = freezed,
    Object? isChecked = freezed,
    Object? description = freezed,
    Object? subSubMaintenances = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      packageTypeId: freezed == packageTypeId
          ? _value.packageTypeId
          : packageTypeId // ignore: cast_nullable_to_non_nullable
              as int?,
      parentId: freezed == parentId
          ? _value.parentId
          : parentId // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      nameRoom: freezed == nameRoom
          ? _value.nameRoom
          : nameRoom // ignore: cast_nullable_to_non_nullable
              as String?,
      nameAr: freezed == nameAr
          ? _value.nameAr
          : nameAr // ignore: cast_nullable_to_non_nullable
              as String?,
      icon: freezed == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as dynamic,
      isChecked: freezed == isChecked
          ? _value.isChecked
          : isChecked // ignore: cast_nullable_to_non_nullable
              as bool?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      subSubMaintenances: freezed == subSubMaintenances
          ? _value.subSubMaintenances
          : subSubMaintenances // ignore: cast_nullable_to_non_nullable
              as List<MaintenancesList>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SubMaintenanceImplCopyWith<$Res>
    implements $SubMaintenanceCopyWith<$Res> {
  factory _$$SubMaintenanceImplCopyWith(_$SubMaintenanceImpl value,
          $Res Function(_$SubMaintenanceImpl) then) =
      __$$SubMaintenanceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "id") int? id,
      @JsonKey(name: "packageTypeId") int? packageTypeId,
      @JsonKey(name: "parentId") int? parentId,
      @JsonKey(name: "name") String? name,
      @JsonKey(name: "nameRoom") String? nameRoom,
      @JsonKey(name: "nameAr") String? nameAr,
      @JsonKey(name: "icon") dynamic icon,
      @JsonKey(name: "isChecked") bool? isChecked,
      @JsonKey(name: "description") String? description,
      @JsonKey(name: "subSubMaintenances")
      List<MaintenancesList>? subSubMaintenances});
}

/// @nodoc
class __$$SubMaintenanceImplCopyWithImpl<$Res>
    extends _$SubMaintenanceCopyWithImpl<$Res, _$SubMaintenanceImpl>
    implements _$$SubMaintenanceImplCopyWith<$Res> {
  __$$SubMaintenanceImplCopyWithImpl(
      _$SubMaintenanceImpl _value, $Res Function(_$SubMaintenanceImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? packageTypeId = freezed,
    Object? parentId = freezed,
    Object? name = freezed,
    Object? nameRoom = freezed,
    Object? nameAr = freezed,
    Object? icon = freezed,
    Object? isChecked = freezed,
    Object? description = freezed,
    Object? subSubMaintenances = freezed,
  }) {
    return _then(_$SubMaintenanceImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      packageTypeId: freezed == packageTypeId
          ? _value.packageTypeId
          : packageTypeId // ignore: cast_nullable_to_non_nullable
              as int?,
      parentId: freezed == parentId
          ? _value.parentId
          : parentId // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      nameRoom: freezed == nameRoom
          ? _value.nameRoom
          : nameRoom // ignore: cast_nullable_to_non_nullable
              as String?,
      nameAr: freezed == nameAr
          ? _value.nameAr
          : nameAr // ignore: cast_nullable_to_non_nullable
              as String?,
      icon: freezed == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as dynamic,
      isChecked: freezed == isChecked
          ? _value.isChecked
          : isChecked // ignore: cast_nullable_to_non_nullable
              as bool?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      subSubMaintenances: freezed == subSubMaintenances
          ? _value._subSubMaintenances
          : subSubMaintenances // ignore: cast_nullable_to_non_nullable
              as List<MaintenancesList>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SubMaintenanceImpl implements _SubMaintenance {
  const _$SubMaintenanceImpl(
      {@JsonKey(name: "id") this.id,
      @JsonKey(name: "packageTypeId") this.packageTypeId,
      @JsonKey(name: "parentId") this.parentId,
      @JsonKey(name: "name") this.name,
      @JsonKey(name: "nameRoom") this.nameRoom,
      @JsonKey(name: "nameAr") this.nameAr,
      @JsonKey(name: "icon") this.icon,
      @JsonKey(name: "isChecked") this.isChecked = false,
      @JsonKey(name: "description") this.description,
      @JsonKey(name: "subSubMaintenances")
      final List<MaintenancesList>? subSubMaintenances})
      : _subSubMaintenances = subSubMaintenances;

  factory _$SubMaintenanceImpl.fromJson(Map<String, dynamic> json) =>
      _$$SubMaintenanceImplFromJson(json);

  @override
  @JsonKey(name: "id")
  final int? id;
  @override
  @JsonKey(name: "packageTypeId")
  final int? packageTypeId;
  @override
  @JsonKey(name: "parentId")
  final int? parentId;
  @override
  @JsonKey(name: "name")
  final String? name;
  @override
  @JsonKey(name: "nameRoom")
  final String? nameRoom;
  @override
  @JsonKey(name: "nameAr")
  final String? nameAr;
  @override
  @JsonKey(name: "icon")
  final dynamic icon;
  @override
  @JsonKey(name: "isChecked")
  final bool? isChecked;
  @override
  @JsonKey(name: "description")
  final String? description;
  final List<MaintenancesList>? _subSubMaintenances;
  @override
  @JsonKey(name: "subSubMaintenances")
  List<MaintenancesList>? get subSubMaintenances {
    final value = _subSubMaintenances;
    if (value == null) return null;
    if (_subSubMaintenances is EqualUnmodifiableListView)
      return _subSubMaintenances;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'SubMaintenance(id: $id, packageTypeId: $packageTypeId, parentId: $parentId, name: $name, nameRoom: $nameRoom, nameAr: $nameAr, icon: $icon, isChecked: $isChecked, description: $description, subSubMaintenances: $subSubMaintenances)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SubMaintenanceImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.packageTypeId, packageTypeId) ||
                other.packageTypeId == packageTypeId) &&
            (identical(other.parentId, parentId) ||
                other.parentId == parentId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.nameRoom, nameRoom) ||
                other.nameRoom == nameRoom) &&
            (identical(other.nameAr, nameAr) || other.nameAr == nameAr) &&
            const DeepCollectionEquality().equals(other.icon, icon) &&
            (identical(other.isChecked, isChecked) ||
                other.isChecked == isChecked) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality()
                .equals(other._subSubMaintenances, _subSubMaintenances));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      packageTypeId,
      parentId,
      name,
      nameRoom,
      nameAr,
      const DeepCollectionEquality().hash(icon),
      isChecked,
      description,
      const DeepCollectionEquality().hash(_subSubMaintenances));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SubMaintenanceImplCopyWith<_$SubMaintenanceImpl> get copyWith =>
      __$$SubMaintenanceImplCopyWithImpl<_$SubMaintenanceImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SubMaintenanceImplToJson(
      this,
    );
  }
}

abstract class _SubMaintenance implements SubMaintenance {
  const factory _SubMaintenance(
      {@JsonKey(name: "id") final int? id,
      @JsonKey(name: "packageTypeId") final int? packageTypeId,
      @JsonKey(name: "parentId") final int? parentId,
      @JsonKey(name: "name") final String? name,
      @JsonKey(name: "nameRoom") final String? nameRoom,
      @JsonKey(name: "nameAr") final String? nameAr,
      @JsonKey(name: "icon") final dynamic icon,
      @JsonKey(name: "isChecked") final bool? isChecked,
      @JsonKey(name: "description") final String? description,
      @JsonKey(name: "subSubMaintenances")
      final List<MaintenancesList>? subSubMaintenances}) = _$SubMaintenanceImpl;

  factory _SubMaintenance.fromJson(Map<String, dynamic> json) =
      _$SubMaintenanceImpl.fromJson;

  @override
  @JsonKey(name: "id")
  int? get id;
  @override
  @JsonKey(name: "packageTypeId")
  int? get packageTypeId;
  @override
  @JsonKey(name: "parentId")
  int? get parentId;
  @override
  @JsonKey(name: "name")
  String? get name;
  @override
  @JsonKey(name: "nameRoom")
  String? get nameRoom;
  @override
  @JsonKey(name: "nameAr")
  String? get nameAr;
  @override
  @JsonKey(name: "icon")
  dynamic get icon;
  @override
  @JsonKey(name: "isChecked")
  bool? get isChecked;
  @override
  @JsonKey(name: "description")
  String? get description;
  @override
  @JsonKey(name: "subSubMaintenances")
  List<MaintenancesList>? get subSubMaintenances;
  @override
  @JsonKey(ignore: true)
  _$$SubMaintenanceImplCopyWith<_$SubMaintenanceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

MaintenancesList _$MaintenancesListFromJson(Map<String, dynamic> json) {
  return _MaintenancesList.fromJson(json);
}

/// @nodoc
mixin _$MaintenancesList {
  @JsonKey(name: "id")
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: "packageTypeId")
  int? get packageTypeId => throw _privateConstructorUsedError;
  @JsonKey(name: "parentId")
  int? get parentId => throw _privateConstructorUsedError;
  @JsonKey(name: "nameRoom")
  String? get nameRoom => throw _privateConstructorUsedError;
  @JsonKey(name: "name")
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: "nameAr")
  String? get nameAr => throw _privateConstructorUsedError;
  @JsonKey(name: "icon")
  dynamic get icon => throw _privateConstructorUsedError;
  @JsonKey(name: "description")
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(name: "score")
  int? get score => throw _privateConstructorUsedError;
  @JsonKey(name: "typeName")
  String? get typeName => throw _privateConstructorUsedError;
  @JsonKey(name: "noteValue")
  String? get noteValue => throw _privateConstructorUsedError;
  @JsonKey(name: "choices")
  List<Choice>? get choices => throw _privateConstructorUsedError;
  @JsonKey(name: "isChecked")
  bool? get isChecked => throw _privateConstructorUsedError;
  @JsonKey(name: "subMaintenances")
  List<SubMaintenance>? get subMaintenances =>
      throw _privateConstructorUsedError;
  @JsonKey(name: "image")
  dynamic get image => throw _privateConstructorUsedError;
  @JsonKey(name: "images")
  List<String>? get images => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MaintenancesListCopyWith<MaintenancesList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MaintenancesListCopyWith<$Res> {
  factory $MaintenancesListCopyWith(
          MaintenancesList value, $Res Function(MaintenancesList) then) =
      _$MaintenancesListCopyWithImpl<$Res, MaintenancesList>;
  @useResult
  $Res call(
      {@JsonKey(name: "id") int? id,
      @JsonKey(name: "packageTypeId") int? packageTypeId,
      @JsonKey(name: "parentId") int? parentId,
      @JsonKey(name: "nameRoom") String? nameRoom,
      @JsonKey(name: "name") String? name,
      @JsonKey(name: "nameAr") String? nameAr,
      @JsonKey(name: "icon") dynamic icon,
      @JsonKey(name: "description") String? description,
      @JsonKey(name: "score") int? score,
      @JsonKey(name: "typeName") String? typeName,
      @JsonKey(name: "noteValue") String? noteValue,
      @JsonKey(name: "choices") List<Choice>? choices,
      @JsonKey(name: "isChecked") bool? isChecked,
      @JsonKey(name: "subMaintenances") List<SubMaintenance>? subMaintenances,
      @JsonKey(name: "image") dynamic image,
      @JsonKey(name: "images") List<String>? images});
}

/// @nodoc
class _$MaintenancesListCopyWithImpl<$Res, $Val extends MaintenancesList>
    implements $MaintenancesListCopyWith<$Res> {
  _$MaintenancesListCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? packageTypeId = freezed,
    Object? parentId = freezed,
    Object? nameRoom = freezed,
    Object? name = freezed,
    Object? nameAr = freezed,
    Object? icon = freezed,
    Object? description = freezed,
    Object? score = freezed,
    Object? typeName = freezed,
    Object? noteValue = freezed,
    Object? choices = freezed,
    Object? isChecked = freezed,
    Object? subMaintenances = freezed,
    Object? image = freezed,
    Object? images = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      packageTypeId: freezed == packageTypeId
          ? _value.packageTypeId
          : packageTypeId // ignore: cast_nullable_to_non_nullable
              as int?,
      parentId: freezed == parentId
          ? _value.parentId
          : parentId // ignore: cast_nullable_to_non_nullable
              as int?,
      nameRoom: freezed == nameRoom
          ? _value.nameRoom
          : nameRoom // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      nameAr: freezed == nameAr
          ? _value.nameAr
          : nameAr // ignore: cast_nullable_to_non_nullable
              as String?,
      icon: freezed == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as dynamic,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      score: freezed == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as int?,
      typeName: freezed == typeName
          ? _value.typeName
          : typeName // ignore: cast_nullable_to_non_nullable
              as String?,
      noteValue: freezed == noteValue
          ? _value.noteValue
          : noteValue // ignore: cast_nullable_to_non_nullable
              as String?,
      choices: freezed == choices
          ? _value.choices
          : choices // ignore: cast_nullable_to_non_nullable
              as List<Choice>?,
      isChecked: freezed == isChecked
          ? _value.isChecked
          : isChecked // ignore: cast_nullable_to_non_nullable
              as bool?,
      subMaintenances: freezed == subMaintenances
          ? _value.subMaintenances
          : subMaintenances // ignore: cast_nullable_to_non_nullable
              as List<SubMaintenance>?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as dynamic,
      images: freezed == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MaintenancesListImplCopyWith<$Res>
    implements $MaintenancesListCopyWith<$Res> {
  factory _$$MaintenancesListImplCopyWith(_$MaintenancesListImpl value,
          $Res Function(_$MaintenancesListImpl) then) =
      __$$MaintenancesListImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "id") int? id,
      @JsonKey(name: "packageTypeId") int? packageTypeId,
      @JsonKey(name: "parentId") int? parentId,
      @JsonKey(name: "nameRoom") String? nameRoom,
      @JsonKey(name: "name") String? name,
      @JsonKey(name: "nameAr") String? nameAr,
      @JsonKey(name: "icon") dynamic icon,
      @JsonKey(name: "description") String? description,
      @JsonKey(name: "score") int? score,
      @JsonKey(name: "typeName") String? typeName,
      @JsonKey(name: "noteValue") String? noteValue,
      @JsonKey(name: "choices") List<Choice>? choices,
      @JsonKey(name: "isChecked") bool? isChecked,
      @JsonKey(name: "subMaintenances") List<SubMaintenance>? subMaintenances,
      @JsonKey(name: "image") dynamic image,
      @JsonKey(name: "images") List<String>? images});
}

/// @nodoc
class __$$MaintenancesListImplCopyWithImpl<$Res>
    extends _$MaintenancesListCopyWithImpl<$Res, _$MaintenancesListImpl>
    implements _$$MaintenancesListImplCopyWith<$Res> {
  __$$MaintenancesListImplCopyWithImpl(_$MaintenancesListImpl _value,
      $Res Function(_$MaintenancesListImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? packageTypeId = freezed,
    Object? parentId = freezed,
    Object? nameRoom = freezed,
    Object? name = freezed,
    Object? nameAr = freezed,
    Object? icon = freezed,
    Object? description = freezed,
    Object? score = freezed,
    Object? typeName = freezed,
    Object? noteValue = freezed,
    Object? choices = freezed,
    Object? isChecked = freezed,
    Object? subMaintenances = freezed,
    Object? image = freezed,
    Object? images = freezed,
  }) {
    return _then(_$MaintenancesListImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      packageTypeId: freezed == packageTypeId
          ? _value.packageTypeId
          : packageTypeId // ignore: cast_nullable_to_non_nullable
              as int?,
      parentId: freezed == parentId
          ? _value.parentId
          : parentId // ignore: cast_nullable_to_non_nullable
              as int?,
      nameRoom: freezed == nameRoom
          ? _value.nameRoom
          : nameRoom // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      nameAr: freezed == nameAr
          ? _value.nameAr
          : nameAr // ignore: cast_nullable_to_non_nullable
              as String?,
      icon: freezed == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as dynamic,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      score: freezed == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as int?,
      typeName: freezed == typeName
          ? _value.typeName
          : typeName // ignore: cast_nullable_to_non_nullable
              as String?,
      noteValue: freezed == noteValue
          ? _value.noteValue
          : noteValue // ignore: cast_nullable_to_non_nullable
              as String?,
      choices: freezed == choices
          ? _value._choices
          : choices // ignore: cast_nullable_to_non_nullable
              as List<Choice>?,
      isChecked: freezed == isChecked
          ? _value.isChecked
          : isChecked // ignore: cast_nullable_to_non_nullable
              as bool?,
      subMaintenances: freezed == subMaintenances
          ? _value._subMaintenances
          : subMaintenances // ignore: cast_nullable_to_non_nullable
              as List<SubMaintenance>?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as dynamic,
      images: freezed == images
          ? _value._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MaintenancesListImpl implements _MaintenancesList {
  const _$MaintenancesListImpl(
      {@JsonKey(name: "id") this.id,
      @JsonKey(name: "packageTypeId") this.packageTypeId,
      @JsonKey(name: "parentId") this.parentId,
      @JsonKey(name: "nameRoom") this.nameRoom,
      @JsonKey(name: "name") this.name,
      @JsonKey(name: "nameAr") this.nameAr,
      @JsonKey(name: "icon") this.icon,
      @JsonKey(name: "description") this.description,
      @JsonKey(name: "score") this.score,
      @JsonKey(name: "typeName") this.typeName,
      @JsonKey(name: "noteValue") this.noteValue,
      @JsonKey(name: "choices") final List<Choice>? choices,
      @JsonKey(name: "isChecked") this.isChecked,
      @JsonKey(name: "subMaintenances")
      final List<SubMaintenance>? subMaintenances,
      @JsonKey(name: "image") this.image,
      @JsonKey(name: "images") final List<String>? images})
      : _choices = choices,
        _subMaintenances = subMaintenances,
        _images = images;

  factory _$MaintenancesListImpl.fromJson(Map<String, dynamic> json) =>
      _$$MaintenancesListImplFromJson(json);

  @override
  @JsonKey(name: "id")
  final int? id;
  @override
  @JsonKey(name: "packageTypeId")
  final int? packageTypeId;
  @override
  @JsonKey(name: "parentId")
  final int? parentId;
  @override
  @JsonKey(name: "nameRoom")
  final String? nameRoom;
  @override
  @JsonKey(name: "name")
  final String? name;
  @override
  @JsonKey(name: "nameAr")
  final String? nameAr;
  @override
  @JsonKey(name: "icon")
  final dynamic icon;
  @override
  @JsonKey(name: "description")
  final String? description;
  @override
  @JsonKey(name: "score")
  final int? score;
  @override
  @JsonKey(name: "typeName")
  final String? typeName;
  @override
  @JsonKey(name: "noteValue")
  final String? noteValue;
  final List<Choice>? _choices;
  @override
  @JsonKey(name: "choices")
  List<Choice>? get choices {
    final value = _choices;
    if (value == null) return null;
    if (_choices is EqualUnmodifiableListView) return _choices;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: "isChecked")
  final bool? isChecked;
  final List<SubMaintenance>? _subMaintenances;
  @override
  @JsonKey(name: "subMaintenances")
  List<SubMaintenance>? get subMaintenances {
    final value = _subMaintenances;
    if (value == null) return null;
    if (_subMaintenances is EqualUnmodifiableListView) return _subMaintenances;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: "image")
  final dynamic image;
  final List<String>? _images;
  @override
  @JsonKey(name: "images")
  List<String>? get images {
    final value = _images;
    if (value == null) return null;
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'MaintenancesList(id: $id, packageTypeId: $packageTypeId, parentId: $parentId, nameRoom: $nameRoom, name: $name, nameAr: $nameAr, icon: $icon, description: $description, score: $score, typeName: $typeName, noteValue: $noteValue, choices: $choices, isChecked: $isChecked, subMaintenances: $subMaintenances, image: $image, images: $images)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MaintenancesListImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.packageTypeId, packageTypeId) ||
                other.packageTypeId == packageTypeId) &&
            (identical(other.parentId, parentId) ||
                other.parentId == parentId) &&
            (identical(other.nameRoom, nameRoom) ||
                other.nameRoom == nameRoom) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.nameAr, nameAr) || other.nameAr == nameAr) &&
            const DeepCollectionEquality().equals(other.icon, icon) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.score, score) || other.score == score) &&
            (identical(other.typeName, typeName) ||
                other.typeName == typeName) &&
            (identical(other.noteValue, noteValue) ||
                other.noteValue == noteValue) &&
            const DeepCollectionEquality().equals(other._choices, _choices) &&
            (identical(other.isChecked, isChecked) ||
                other.isChecked == isChecked) &&
            const DeepCollectionEquality()
                .equals(other._subMaintenances, _subMaintenances) &&
            const DeepCollectionEquality().equals(other.image, image) &&
            const DeepCollectionEquality().equals(other._images, _images));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      packageTypeId,
      parentId,
      nameRoom,
      name,
      nameAr,
      const DeepCollectionEquality().hash(icon),
      description,
      score,
      typeName,
      noteValue,
      const DeepCollectionEquality().hash(_choices),
      isChecked,
      const DeepCollectionEquality().hash(_subMaintenances),
      const DeepCollectionEquality().hash(image),
      const DeepCollectionEquality().hash(_images));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MaintenancesListImplCopyWith<_$MaintenancesListImpl> get copyWith =>
      __$$MaintenancesListImplCopyWithImpl<_$MaintenancesListImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MaintenancesListImplToJson(
      this,
    );
  }
}

abstract class _MaintenancesList implements MaintenancesList {
  const factory _MaintenancesList(
          {@JsonKey(name: "id") final int? id,
          @JsonKey(name: "packageTypeId") final int? packageTypeId,
          @JsonKey(name: "parentId") final int? parentId,
          @JsonKey(name: "nameRoom") final String? nameRoom,
          @JsonKey(name: "name") final String? name,
          @JsonKey(name: "nameAr") final String? nameAr,
          @JsonKey(name: "icon") final dynamic icon,
          @JsonKey(name: "description") final String? description,
          @JsonKey(name: "score") final int? score,
          @JsonKey(name: "typeName") final String? typeName,
          @JsonKey(name: "noteValue") final String? noteValue,
          @JsonKey(name: "choices") final List<Choice>? choices,
          @JsonKey(name: "isChecked") final bool? isChecked,
          @JsonKey(name: "subMaintenances")
          final List<SubMaintenance>? subMaintenances,
          @JsonKey(name: "image") final dynamic image,
          @JsonKey(name: "images") final List<String>? images}) =
      _$MaintenancesListImpl;

  factory _MaintenancesList.fromJson(Map<String, dynamic> json) =
      _$MaintenancesListImpl.fromJson;

  @override
  @JsonKey(name: "id")
  int? get id;
  @override
  @JsonKey(name: "packageTypeId")
  int? get packageTypeId;
  @override
  @JsonKey(name: "parentId")
  int? get parentId;
  @override
  @JsonKey(name: "nameRoom")
  String? get nameRoom;
  @override
  @JsonKey(name: "name")
  String? get name;
  @override
  @JsonKey(name: "nameAr")
  String? get nameAr;
  @override
  @JsonKey(name: "icon")
  dynamic get icon;
  @override
  @JsonKey(name: "description")
  String? get description;
  @override
  @JsonKey(name: "score")
  int? get score;
  @override
  @JsonKey(name: "typeName")
  String? get typeName;
  @override
  @JsonKey(name: "noteValue")
  String? get noteValue;
  @override
  @JsonKey(name: "choices")
  List<Choice>? get choices;
  @override
  @JsonKey(name: "isChecked")
  bool? get isChecked;
  @override
  @JsonKey(name: "subMaintenances")
  List<SubMaintenance>? get subMaintenances;
  @override
  @JsonKey(name: "image")
  dynamic get image;
  @override
  @JsonKey(name: "images")
  List<String>? get images;
  @override
  @JsonKey(ignore: true)
  _$$MaintenancesListImplCopyWith<_$MaintenancesListImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Choice _$ChoiceFromJson(Map<String, dynamic> json) {
  return _Choice.fromJson(json);
}

/// @nodoc
mixin _$Choice {
  @JsonKey(name: "id")
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: "packageId")
  int? get packageId => throw _privateConstructorUsedError;
  @JsonKey(name: "parentId")
  int? get parentId => throw _privateConstructorUsedError;
  @JsonKey(name: "nameRoom")
  String? get nameRoom => throw _privateConstructorUsedError;
  @JsonKey(name: "name")
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: "nameAr")
  String? get nameAr => throw _privateConstructorUsedError;
  @JsonKey(name: "isSelected")
  bool? get isSelected => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChoiceCopyWith<Choice> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChoiceCopyWith<$Res> {
  factory $ChoiceCopyWith(Choice value, $Res Function(Choice) then) =
      _$ChoiceCopyWithImpl<$Res, Choice>;
  @useResult
  $Res call(
      {@JsonKey(name: "id") int? id,
      @JsonKey(name: "packageId") int? packageId,
      @JsonKey(name: "parentId") int? parentId,
      @JsonKey(name: "nameRoom") String? nameRoom,
      @JsonKey(name: "name") String? name,
      @JsonKey(name: "nameAr") String? nameAr,
      @JsonKey(name: "isSelected") bool? isSelected});
}

/// @nodoc
class _$ChoiceCopyWithImpl<$Res, $Val extends Choice>
    implements $ChoiceCopyWith<$Res> {
  _$ChoiceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? packageId = freezed,
    Object? parentId = freezed,
    Object? nameRoom = freezed,
    Object? name = freezed,
    Object? nameAr = freezed,
    Object? isSelected = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      packageId: freezed == packageId
          ? _value.packageId
          : packageId // ignore: cast_nullable_to_non_nullable
              as int?,
      parentId: freezed == parentId
          ? _value.parentId
          : parentId // ignore: cast_nullable_to_non_nullable
              as int?,
      nameRoom: freezed == nameRoom
          ? _value.nameRoom
          : nameRoom // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      nameAr: freezed == nameAr
          ? _value.nameAr
          : nameAr // ignore: cast_nullable_to_non_nullable
              as String?,
      isSelected: freezed == isSelected
          ? _value.isSelected
          : isSelected // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChoiceImplCopyWith<$Res> implements $ChoiceCopyWith<$Res> {
  factory _$$ChoiceImplCopyWith(
          _$ChoiceImpl value, $Res Function(_$ChoiceImpl) then) =
      __$$ChoiceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "id") int? id,
      @JsonKey(name: "packageId") int? packageId,
      @JsonKey(name: "parentId") int? parentId,
      @JsonKey(name: "nameRoom") String? nameRoom,
      @JsonKey(name: "name") String? name,
      @JsonKey(name: "nameAr") String? nameAr,
      @JsonKey(name: "isSelected") bool? isSelected});
}

/// @nodoc
class __$$ChoiceImplCopyWithImpl<$Res>
    extends _$ChoiceCopyWithImpl<$Res, _$ChoiceImpl>
    implements _$$ChoiceImplCopyWith<$Res> {
  __$$ChoiceImplCopyWithImpl(
      _$ChoiceImpl _value, $Res Function(_$ChoiceImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? packageId = freezed,
    Object? parentId = freezed,
    Object? nameRoom = freezed,
    Object? name = freezed,
    Object? nameAr = freezed,
    Object? isSelected = freezed,
  }) {
    return _then(_$ChoiceImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      packageId: freezed == packageId
          ? _value.packageId
          : packageId // ignore: cast_nullable_to_non_nullable
              as int?,
      parentId: freezed == parentId
          ? _value.parentId
          : parentId // ignore: cast_nullable_to_non_nullable
              as int?,
      nameRoom: freezed == nameRoom
          ? _value.nameRoom
          : nameRoom // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      nameAr: freezed == nameAr
          ? _value.nameAr
          : nameAr // ignore: cast_nullable_to_non_nullable
              as String?,
      isSelected: freezed == isSelected
          ? _value.isSelected
          : isSelected // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChoiceImpl implements _Choice {
  const _$ChoiceImpl(
      {@JsonKey(name: "id") this.id,
      @JsonKey(name: "packageId") this.packageId,
      @JsonKey(name: "parentId") this.parentId,
      @JsonKey(name: "nameRoom") this.nameRoom,
      @JsonKey(name: "name") this.name,
      @JsonKey(name: "nameAr") this.nameAr,
      @JsonKey(name: "isSelected") this.isSelected});

  factory _$ChoiceImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChoiceImplFromJson(json);

  @override
  @JsonKey(name: "id")
  final int? id;
  @override
  @JsonKey(name: "packageId")
  final int? packageId;
  @override
  @JsonKey(name: "parentId")
  final int? parentId;
  @override
  @JsonKey(name: "nameRoom")
  final String? nameRoom;
  @override
  @JsonKey(name: "name")
  final String? name;
  @override
  @JsonKey(name: "nameAr")
  final String? nameAr;
  @override
  @JsonKey(name: "isSelected")
  final bool? isSelected;

  @override
  String toString() {
    return 'Choice(id: $id, packageId: $packageId, parentId: $parentId, nameRoom: $nameRoom, name: $name, nameAr: $nameAr, isSelected: $isSelected)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChoiceImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.packageId, packageId) ||
                other.packageId == packageId) &&
            (identical(other.parentId, parentId) ||
                other.parentId == parentId) &&
            (identical(other.nameRoom, nameRoom) ||
                other.nameRoom == nameRoom) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.nameAr, nameAr) || other.nameAr == nameAr) &&
            (identical(other.isSelected, isSelected) ||
                other.isSelected == isSelected));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, packageId, parentId, nameRoom, name, nameAr, isSelected);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChoiceImplCopyWith<_$ChoiceImpl> get copyWith =>
      __$$ChoiceImplCopyWithImpl<_$ChoiceImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChoiceImplToJson(
      this,
    );
  }
}

abstract class _Choice implements Choice {
  const factory _Choice(
      {@JsonKey(name: "id") final int? id,
      @JsonKey(name: "packageId") final int? packageId,
      @JsonKey(name: "parentId") final int? parentId,
      @JsonKey(name: "nameRoom") final String? nameRoom,
      @JsonKey(name: "name") final String? name,
      @JsonKey(name: "nameAr") final String? nameAr,
      @JsonKey(name: "isSelected") final bool? isSelected}) = _$ChoiceImpl;

  factory _Choice.fromJson(Map<String, dynamic> json) = _$ChoiceImpl.fromJson;

  @override
  @JsonKey(name: "id")
  int? get id;
  @override
  @JsonKey(name: "packageId")
  int? get packageId;
  @override
  @JsonKey(name: "parentId")
  int? get parentId;
  @override
  @JsonKey(name: "nameRoom")
  String? get nameRoom;
  @override
  @JsonKey(name: "name")
  String? get name;
  @override
  @JsonKey(name: "nameAr")
  String? get nameAr;
  @override
  @JsonKey(name: "isSelected")
  bool? get isSelected;
  @override
  @JsonKey(ignore: true)
  _$$ChoiceImplCopyWith<_$ChoiceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
