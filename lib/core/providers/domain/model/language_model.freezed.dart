// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'language_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AppLanguageModel _$AppLanguageModelFromJson(Map<String, dynamic> json) {
  return _AppLanguageModel.fromJson(json);
}

/// @nodoc
mixin _$AppLanguageModel {
  @JsonKey(name: "languages")
  List<Languages>? get languages => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AppLanguageModelCopyWith<AppLanguageModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppLanguageModelCopyWith<$Res> {
  factory $AppLanguageModelCopyWith(
          AppLanguageModel value, $Res Function(AppLanguageModel) then) =
      _$AppLanguageModelCopyWithImpl<$Res, AppLanguageModel>;
  @useResult
  $Res call({@JsonKey(name: "languages") List<Languages>? languages});
}

/// @nodoc
class _$AppLanguageModelCopyWithImpl<$Res, $Val extends AppLanguageModel>
    implements $AppLanguageModelCopyWith<$Res> {
  _$AppLanguageModelCopyWithImpl(this._value, this._then);

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
              as List<Languages>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AppLanguageModelImplCopyWith<$Res>
    implements $AppLanguageModelCopyWith<$Res> {
  factory _$$AppLanguageModelImplCopyWith(_$AppLanguageModelImpl value,
          $Res Function(_$AppLanguageModelImpl) then) =
      __$$AppLanguageModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: "languages") List<Languages>? languages});
}

/// @nodoc
class __$$AppLanguageModelImplCopyWithImpl<$Res>
    extends _$AppLanguageModelCopyWithImpl<$Res, _$AppLanguageModelImpl>
    implements _$$AppLanguageModelImplCopyWith<$Res> {
  __$$AppLanguageModelImplCopyWithImpl(_$AppLanguageModelImpl _value,
      $Res Function(_$AppLanguageModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? languages = freezed,
  }) {
    return _then(_$AppLanguageModelImpl(
      languages: freezed == languages
          ? _value._languages
          : languages // ignore: cast_nullable_to_non_nullable
              as List<Languages>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AppLanguageModelImpl implements _AppLanguageModel {
  const _$AppLanguageModelImpl(
      {@JsonKey(name: "languages") final List<Languages>? languages})
      : _languages = languages;

  factory _$AppLanguageModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AppLanguageModelImplFromJson(json);

  final List<Languages>? _languages;
  @override
  @JsonKey(name: "languages")
  List<Languages>? get languages {
    final value = _languages;
    if (value == null) return null;
    if (_languages is EqualUnmodifiableListView) return _languages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'AppLanguageModel(languages: $languages)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppLanguageModelImpl &&
            const DeepCollectionEquality()
                .equals(other._languages, _languages));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_languages));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AppLanguageModelImplCopyWith<_$AppLanguageModelImpl> get copyWith =>
      __$$AppLanguageModelImplCopyWithImpl<_$AppLanguageModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AppLanguageModelImplToJson(
      this,
    );
  }
}

abstract class _AppLanguageModel implements AppLanguageModel {
  const factory _AppLanguageModel(
          {@JsonKey(name: "languages") final List<Languages>? languages}) =
      _$AppLanguageModelImpl;

  factory _AppLanguageModel.fromJson(Map<String, dynamic> json) =
      _$AppLanguageModelImpl.fromJson;

  @override
  @JsonKey(name: "languages")
  List<Languages>? get languages;
  @override
  @JsonKey(ignore: true)
  _$$AppLanguageModelImplCopyWith<_$AppLanguageModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Languages _$LanguagesFromJson(Map<String, dynamic> json) {
  return _Languages.fromJson(json);
}

/// @nodoc
mixin _$Languages {
  @JsonKey(name: "name")
  dynamic get name => throw _privateConstructorUsedError;
  @JsonKey(name: "flag")
  dynamic get flag => throw _privateConstructorUsedError;
  @JsonKey(name: "code")
  dynamic get code => throw _privateConstructorUsedError;
  @JsonKey(name: "lang")
  dynamic get lang => throw _privateConstructorUsedError;
  @JsonKey(name: "languages")
  List<SubLanguage>? get languages => throw _privateConstructorUsedError;
  @JsonKey(name: "key")
  String? get key => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LanguagesCopyWith<Languages> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LanguagesCopyWith<$Res> {
  factory $LanguagesCopyWith(Languages value, $Res Function(Languages) then) =
      _$LanguagesCopyWithImpl<$Res, Languages>;
  @useResult
  $Res call(
      {@JsonKey(name: "name") dynamic name,
      @JsonKey(name: "flag") dynamic flag,
      @JsonKey(name: "code") dynamic code,
      @JsonKey(name: "lang") dynamic lang,
      @JsonKey(name: "languages") List<SubLanguage>? languages,
      @JsonKey(name: "key") String? key});
}

/// @nodoc
class _$LanguagesCopyWithImpl<$Res, $Val extends Languages>
    implements $LanguagesCopyWith<$Res> {
  _$LanguagesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? flag = freezed,
    Object? code = freezed,
    Object? lang = freezed,
    Object? languages = freezed,
    Object? key = freezed,
  }) {
    return _then(_value.copyWith(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as dynamic,
      flag: freezed == flag
          ? _value.flag
          : flag // ignore: cast_nullable_to_non_nullable
              as dynamic,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as dynamic,
      lang: freezed == lang
          ? _value.lang
          : lang // ignore: cast_nullable_to_non_nullable
              as dynamic,
      languages: freezed == languages
          ? _value.languages
          : languages // ignore: cast_nullable_to_non_nullable
              as List<SubLanguage>?,
      key: freezed == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LanguagesImplCopyWith<$Res>
    implements $LanguagesCopyWith<$Res> {
  factory _$$LanguagesImplCopyWith(
          _$LanguagesImpl value, $Res Function(_$LanguagesImpl) then) =
      __$$LanguagesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "name") dynamic name,
      @JsonKey(name: "flag") dynamic flag,
      @JsonKey(name: "code") dynamic code,
      @JsonKey(name: "lang") dynamic lang,
      @JsonKey(name: "languages") List<SubLanguage>? languages,
      @JsonKey(name: "key") String? key});
}

/// @nodoc
class __$$LanguagesImplCopyWithImpl<$Res>
    extends _$LanguagesCopyWithImpl<$Res, _$LanguagesImpl>
    implements _$$LanguagesImplCopyWith<$Res> {
  __$$LanguagesImplCopyWithImpl(
      _$LanguagesImpl _value, $Res Function(_$LanguagesImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? flag = freezed,
    Object? code = freezed,
    Object? lang = freezed,
    Object? languages = freezed,
    Object? key = freezed,
  }) {
    return _then(_$LanguagesImpl(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as dynamic,
      flag: freezed == flag
          ? _value.flag
          : flag // ignore: cast_nullable_to_non_nullable
              as dynamic,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as dynamic,
      lang: freezed == lang
          ? _value.lang
          : lang // ignore: cast_nullable_to_non_nullable
              as dynamic,
      languages: freezed == languages
          ? _value._languages
          : languages // ignore: cast_nullable_to_non_nullable
              as List<SubLanguage>?,
      key: freezed == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LanguagesImpl implements _Languages {
  const _$LanguagesImpl(
      {@JsonKey(name: "name") this.name,
      @JsonKey(name: "flag") this.flag,
      @JsonKey(name: "code") this.code,
      @JsonKey(name: "lang") this.lang,
      @JsonKey(name: "languages") final List<SubLanguage>? languages,
      @JsonKey(name: "key") this.key})
      : _languages = languages;

  factory _$LanguagesImpl.fromJson(Map<String, dynamic> json) =>
      _$$LanguagesImplFromJson(json);

  @override
  @JsonKey(name: "name")
  final dynamic name;
  @override
  @JsonKey(name: "flag")
  final dynamic flag;
  @override
  @JsonKey(name: "code")
  final dynamic code;
  @override
  @JsonKey(name: "lang")
  final dynamic lang;
  final List<SubLanguage>? _languages;
  @override
  @JsonKey(name: "languages")
  List<SubLanguage>? get languages {
    final value = _languages;
    if (value == null) return null;
    if (_languages is EqualUnmodifiableListView) return _languages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: "key")
  final String? key;

  @override
  String toString() {
    return 'Languages(name: $name, flag: $flag, code: $code, lang: $lang, languages: $languages, key: $key)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LanguagesImpl &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.flag, flag) &&
            const DeepCollectionEquality().equals(other.code, code) &&
            const DeepCollectionEquality().equals(other.lang, lang) &&
            const DeepCollectionEquality()
                .equals(other._languages, _languages) &&
            (identical(other.key, key) || other.key == key));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(flag),
      const DeepCollectionEquality().hash(code),
      const DeepCollectionEquality().hash(lang),
      const DeepCollectionEquality().hash(_languages),
      key);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LanguagesImplCopyWith<_$LanguagesImpl> get copyWith =>
      __$$LanguagesImplCopyWithImpl<_$LanguagesImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LanguagesImplToJson(
      this,
    );
  }
}

abstract class _Languages implements Languages {
  const factory _Languages(
      {@JsonKey(name: "name") final dynamic name,
      @JsonKey(name: "flag") final dynamic flag,
      @JsonKey(name: "code") final dynamic code,
      @JsonKey(name: "lang") final dynamic lang,
      @JsonKey(name: "languages") final List<SubLanguage>? languages,
      @JsonKey(name: "key") final String? key}) = _$LanguagesImpl;

  factory _Languages.fromJson(Map<String, dynamic> json) =
      _$LanguagesImpl.fromJson;

  @override
  @JsonKey(name: "name")
  dynamic get name;
  @override
  @JsonKey(name: "flag")
  dynamic get flag;
  @override
  @JsonKey(name: "code")
  dynamic get code;
  @override
  @JsonKey(name: "lang")
  dynamic get lang;
  @override
  @JsonKey(name: "languages")
  List<SubLanguage>? get languages;
  @override
  @JsonKey(name: "key")
  String? get key;
  @override
  @JsonKey(ignore: true)
  _$$LanguagesImplCopyWith<_$LanguagesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SubLanguage _$SubLanguageFromJson(Map<String, dynamic> json) {
  return _SubLanguage.fromJson(json);
}

/// @nodoc
mixin _$SubLanguage {
  @JsonKey(name: "id")
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: "wordKey")
  String? get wordKey => throw _privateConstructorUsedError;
  @JsonKey(name: "value")
  String? get value => throw _privateConstructorUsedError;
  @JsonKey(name: "lang")
  String? get lang => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SubLanguageCopyWith<SubLanguage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubLanguageCopyWith<$Res> {
  factory $SubLanguageCopyWith(
          SubLanguage value, $Res Function(SubLanguage) then) =
      _$SubLanguageCopyWithImpl<$Res, SubLanguage>;
  @useResult
  $Res call(
      {@JsonKey(name: "id") int? id,
      @JsonKey(name: "wordKey") String? wordKey,
      @JsonKey(name: "value") String? value,
      @JsonKey(name: "lang") String? lang});
}

/// @nodoc
class _$SubLanguageCopyWithImpl<$Res, $Val extends SubLanguage>
    implements $SubLanguageCopyWith<$Res> {
  _$SubLanguageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? wordKey = freezed,
    Object? value = freezed,
    Object? lang = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      wordKey: freezed == wordKey
          ? _value.wordKey
          : wordKey // ignore: cast_nullable_to_non_nullable
              as String?,
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String?,
      lang: freezed == lang
          ? _value.lang
          : lang // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SubLanguageImplCopyWith<$Res>
    implements $SubLanguageCopyWith<$Res> {
  factory _$$SubLanguageImplCopyWith(
          _$SubLanguageImpl value, $Res Function(_$SubLanguageImpl) then) =
      __$$SubLanguageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "id") int? id,
      @JsonKey(name: "wordKey") String? wordKey,
      @JsonKey(name: "value") String? value,
      @JsonKey(name: "lang") String? lang});
}

/// @nodoc
class __$$SubLanguageImplCopyWithImpl<$Res>
    extends _$SubLanguageCopyWithImpl<$Res, _$SubLanguageImpl>
    implements _$$SubLanguageImplCopyWith<$Res> {
  __$$SubLanguageImplCopyWithImpl(
      _$SubLanguageImpl _value, $Res Function(_$SubLanguageImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? wordKey = freezed,
    Object? value = freezed,
    Object? lang = freezed,
  }) {
    return _then(_$SubLanguageImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      wordKey: freezed == wordKey
          ? _value.wordKey
          : wordKey // ignore: cast_nullable_to_non_nullable
              as String?,
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String?,
      lang: freezed == lang
          ? _value.lang
          : lang // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SubLanguageImpl implements _SubLanguage {
  const _$SubLanguageImpl(
      {@JsonKey(name: "id") this.id,
      @JsonKey(name: "wordKey") this.wordKey,
      @JsonKey(name: "value") this.value,
      @JsonKey(name: "lang") this.lang});

  factory _$SubLanguageImpl.fromJson(Map<String, dynamic> json) =>
      _$$SubLanguageImplFromJson(json);

  @override
  @JsonKey(name: "id")
  final int? id;
  @override
  @JsonKey(name: "wordKey")
  final String? wordKey;
  @override
  @JsonKey(name: "value")
  final String? value;
  @override
  @JsonKey(name: "lang")
  final String? lang;

  @override
  String toString() {
    return 'SubLanguage(id: $id, wordKey: $wordKey, value: $value, lang: $lang)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SubLanguageImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.wordKey, wordKey) || other.wordKey == wordKey) &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.lang, lang) || other.lang == lang));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, wordKey, value, lang);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SubLanguageImplCopyWith<_$SubLanguageImpl> get copyWith =>
      __$$SubLanguageImplCopyWithImpl<_$SubLanguageImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SubLanguageImplToJson(
      this,
    );
  }
}

abstract class _SubLanguage implements SubLanguage {
  const factory _SubLanguage(
      {@JsonKey(name: "id") final int? id,
      @JsonKey(name: "wordKey") final String? wordKey,
      @JsonKey(name: "value") final String? value,
      @JsonKey(name: "lang") final String? lang}) = _$SubLanguageImpl;

  factory _SubLanguage.fromJson(Map<String, dynamic> json) =
      _$SubLanguageImpl.fromJson;

  @override
  @JsonKey(name: "id")
  int? get id;
  @override
  @JsonKey(name: "wordKey")
  String? get wordKey;
  @override
  @JsonKey(name: "value")
  String? get value;
  @override
  @JsonKey(name: "lang")
  String? get lang;
  @override
  @JsonKey(ignore: true)
  _$$SubLanguageImplCopyWith<_$SubLanguageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
