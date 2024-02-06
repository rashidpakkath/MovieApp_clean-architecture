// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'youtube_api_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TrailerModel _$TrailerModelFromJson(Map<String, dynamic> json) {
  return _TrailerModel.fromJson(json);
}

/// @nodoc
mixin _$TrailerModel {
  int get id => throw _privateConstructorUsedError;
  List<Result> get results => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TrailerModelCopyWith<TrailerModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TrailerModelCopyWith<$Res> {
  factory $TrailerModelCopyWith(
          TrailerModel value, $Res Function(TrailerModel) then) =
      _$TrailerModelCopyWithImpl<$Res, TrailerModel>;
  @useResult
  $Res call({int id, List<Result> results});
}

/// @nodoc
class _$TrailerModelCopyWithImpl<$Res, $Val extends TrailerModel>
    implements $TrailerModelCopyWith<$Res> {
  _$TrailerModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? results = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      results: null == results
          ? _value.results
          : results // ignore: cast_nullable_to_non_nullable
              as List<Result>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TrailerModelImplCopyWith<$Res>
    implements $TrailerModelCopyWith<$Res> {
  factory _$$TrailerModelImplCopyWith(
          _$TrailerModelImpl value, $Res Function(_$TrailerModelImpl) then) =
      __$$TrailerModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, List<Result> results});
}

/// @nodoc
class __$$TrailerModelImplCopyWithImpl<$Res>
    extends _$TrailerModelCopyWithImpl<$Res, _$TrailerModelImpl>
    implements _$$TrailerModelImplCopyWith<$Res> {
  __$$TrailerModelImplCopyWithImpl(
      _$TrailerModelImpl _value, $Res Function(_$TrailerModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? results = null,
  }) {
    return _then(_$TrailerModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      results: null == results
          ? _value._results
          : results // ignore: cast_nullable_to_non_nullable
              as List<Result>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TrailerModelImpl implements _TrailerModel {
  const _$TrailerModelImpl(
      {required this.id, required final List<Result> results})
      : _results = results;

  factory _$TrailerModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$TrailerModelImplFromJson(json);

  @override
  final int id;
  final List<Result> _results;
  @override
  List<Result> get results {
    if (_results is EqualUnmodifiableListView) return _results;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_results);
  }

  @override
  String toString() {
    return 'TrailerModel(id: $id, results: $results)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TrailerModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality().equals(other._results, _results));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, const DeepCollectionEquality().hash(_results));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TrailerModelImplCopyWith<_$TrailerModelImpl> get copyWith =>
      __$$TrailerModelImplCopyWithImpl<_$TrailerModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TrailerModelImplToJson(
      this,
    );
  }
}

abstract class _TrailerModel implements TrailerModel {
  const factory _TrailerModel(
      {required final int id,
      required final List<Result> results}) = _$TrailerModelImpl;

  factory _TrailerModel.fromJson(Map<String, dynamic> json) =
      _$TrailerModelImpl.fromJson;

  @override
  int get id;
  @override
  List<Result> get results;
  @override
  @JsonKey(ignore: true)
  _$$TrailerModelImplCopyWith<_$TrailerModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Result _$ResultFromJson(Map<String, dynamic> json) {
  return _Result.fromJson(json);
}

/// @nodoc
mixin _$Result {
  @JsonKey(name: "iso_639_1")
  String get iso6391 => throw _privateConstructorUsedError;
  @JsonKey(name: "iso_3166_1")
  String get iso31661 => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get key => throw _privateConstructorUsedError;
  String get site => throw _privateConstructorUsedError;
  int get size => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  bool get official => throw _privateConstructorUsedError;
  @JsonKey(name: "published_at")
  DateTime get publishedAt => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ResultCopyWith<Result> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResultCopyWith<$Res> {
  factory $ResultCopyWith(Result value, $Res Function(Result) then) =
      _$ResultCopyWithImpl<$Res, Result>;
  @useResult
  $Res call(
      {@JsonKey(name: "iso_639_1") String iso6391,
      @JsonKey(name: "iso_3166_1") String iso31661,
      String name,
      String key,
      String site,
      int size,
      String type,
      bool official,
      @JsonKey(name: "published_at") DateTime publishedAt,
      String id});
}

/// @nodoc
class _$ResultCopyWithImpl<$Res, $Val extends Result>
    implements $ResultCopyWith<$Res> {
  _$ResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? iso6391 = null,
    Object? iso31661 = null,
    Object? name = null,
    Object? key = null,
    Object? site = null,
    Object? size = null,
    Object? type = null,
    Object? official = null,
    Object? publishedAt = null,
    Object? id = null,
  }) {
    return _then(_value.copyWith(
      iso6391: null == iso6391
          ? _value.iso6391
          : iso6391 // ignore: cast_nullable_to_non_nullable
              as String,
      iso31661: null == iso31661
          ? _value.iso31661
          : iso31661 // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      key: null == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String,
      site: null == site
          ? _value.site
          : site // ignore: cast_nullable_to_non_nullable
              as String,
      size: null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      official: null == official
          ? _value.official
          : official // ignore: cast_nullable_to_non_nullable
              as bool,
      publishedAt: null == publishedAt
          ? _value.publishedAt
          : publishedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ResultImplCopyWith<$Res> implements $ResultCopyWith<$Res> {
  factory _$$ResultImplCopyWith(
          _$ResultImpl value, $Res Function(_$ResultImpl) then) =
      __$$ResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "iso_639_1") String iso6391,
      @JsonKey(name: "iso_3166_1") String iso31661,
      String name,
      String key,
      String site,
      int size,
      String type,
      bool official,
      @JsonKey(name: "published_at") DateTime publishedAt,
      String id});
}

/// @nodoc
class __$$ResultImplCopyWithImpl<$Res>
    extends _$ResultCopyWithImpl<$Res, _$ResultImpl>
    implements _$$ResultImplCopyWith<$Res> {
  __$$ResultImplCopyWithImpl(
      _$ResultImpl _value, $Res Function(_$ResultImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? iso6391 = null,
    Object? iso31661 = null,
    Object? name = null,
    Object? key = null,
    Object? site = null,
    Object? size = null,
    Object? type = null,
    Object? official = null,
    Object? publishedAt = null,
    Object? id = null,
  }) {
    return _then(_$ResultImpl(
      iso6391: null == iso6391
          ? _value.iso6391
          : iso6391 // ignore: cast_nullable_to_non_nullable
              as String,
      iso31661: null == iso31661
          ? _value.iso31661
          : iso31661 // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      key: null == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String,
      site: null == site
          ? _value.site
          : site // ignore: cast_nullable_to_non_nullable
              as String,
      size: null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      official: null == official
          ? _value.official
          : official // ignore: cast_nullable_to_non_nullable
              as bool,
      publishedAt: null == publishedAt
          ? _value.publishedAt
          : publishedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ResultImpl implements _Result {
  const _$ResultImpl(
      {@JsonKey(name: "iso_639_1") required this.iso6391,
      @JsonKey(name: "iso_3166_1") required this.iso31661,
      required this.name,
      required this.key,
      required this.site,
      required this.size,
      required this.type,
      required this.official,
      @JsonKey(name: "published_at") required this.publishedAt,
      required this.id});

  factory _$ResultImpl.fromJson(Map<String, dynamic> json) =>
      _$$ResultImplFromJson(json);

  @override
  @JsonKey(name: "iso_639_1")
  final String iso6391;
  @override
  @JsonKey(name: "iso_3166_1")
  final String iso31661;
  @override
  final String name;
  @override
  final String key;
  @override
  final String site;
  @override
  final int size;
  @override
  final String type;
  @override
  final bool official;
  @override
  @JsonKey(name: "published_at")
  final DateTime publishedAt;
  @override
  final String id;

  @override
  String toString() {
    return 'Result(iso6391: $iso6391, iso31661: $iso31661, name: $name, key: $key, site: $site, size: $size, type: $type, official: $official, publishedAt: $publishedAt, id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResultImpl &&
            (identical(other.iso6391, iso6391) || other.iso6391 == iso6391) &&
            (identical(other.iso31661, iso31661) ||
                other.iso31661 == iso31661) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.key, key) || other.key == key) &&
            (identical(other.site, site) || other.site == site) &&
            (identical(other.size, size) || other.size == size) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.official, official) ||
                other.official == official) &&
            (identical(other.publishedAt, publishedAt) ||
                other.publishedAt == publishedAt) &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, iso6391, iso31661, name, key,
      site, size, type, official, publishedAt, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ResultImplCopyWith<_$ResultImpl> get copyWith =>
      __$$ResultImplCopyWithImpl<_$ResultImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ResultImplToJson(
      this,
    );
  }
}

abstract class _Result implements Result {
  const factory _Result(
      {@JsonKey(name: "iso_639_1") required final String iso6391,
      @JsonKey(name: "iso_3166_1") required final String iso31661,
      required final String name,
      required final String key,
      required final String site,
      required final int size,
      required final String type,
      required final bool official,
      @JsonKey(name: "published_at") required final DateTime publishedAt,
      required final String id}) = _$ResultImpl;

  factory _Result.fromJson(Map<String, dynamic> json) = _$ResultImpl.fromJson;

  @override
  @JsonKey(name: "iso_639_1")
  String get iso6391;
  @override
  @JsonKey(name: "iso_3166_1")
  String get iso31661;
  @override
  String get name;
  @override
  String get key;
  @override
  String get site;
  @override
  int get size;
  @override
  String get type;
  @override
  bool get official;
  @override
  @JsonKey(name: "published_at")
  DateTime get publishedAt;
  @override
  String get id;
  @override
  @JsonKey(ignore: true)
  _$$ResultImplCopyWith<_$ResultImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
