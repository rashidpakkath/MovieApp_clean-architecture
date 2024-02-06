// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'youtube_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$YoutubeEntity {
  @JsonKey(name: "name")
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: "key")
  String? get key => throw _privateConstructorUsedError;
  @JsonKey(name: "site")
  String? get site => throw _privateConstructorUsedError;
  @JsonKey(name: "type")
  String? get type => throw _privateConstructorUsedError;
  @JsonKey(name: "official")
  bool? get official => throw _privateConstructorUsedError;
  @JsonKey(name: "id")
  String? get id => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $YoutubeEntityCopyWith<YoutubeEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $YoutubeEntityCopyWith<$Res> {
  factory $YoutubeEntityCopyWith(
          YoutubeEntity value, $Res Function(YoutubeEntity) then) =
      _$YoutubeEntityCopyWithImpl<$Res, YoutubeEntity>;
  @useResult
  $Res call(
      {@JsonKey(name: "name") String? name,
      @JsonKey(name: "key") String? key,
      @JsonKey(name: "site") String? site,
      @JsonKey(name: "type") String? type,
      @JsonKey(name: "official") bool? official,
      @JsonKey(name: "id") String? id});
}

/// @nodoc
class _$YoutubeEntityCopyWithImpl<$Res, $Val extends YoutubeEntity>
    implements $YoutubeEntityCopyWith<$Res> {
  _$YoutubeEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? key = freezed,
    Object? site = freezed,
    Object? type = freezed,
    Object? official = freezed,
    Object? id = freezed,
  }) {
    return _then(_value.copyWith(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      key: freezed == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String?,
      site: freezed == site
          ? _value.site
          : site // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      official: freezed == official
          ? _value.official
          : official // ignore: cast_nullable_to_non_nullable
              as bool?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$YoutubeEntityImplCopyWith<$Res>
    implements $YoutubeEntityCopyWith<$Res> {
  factory _$$YoutubeEntityImplCopyWith(
          _$YoutubeEntityImpl value, $Res Function(_$YoutubeEntityImpl) then) =
      __$$YoutubeEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "name") String? name,
      @JsonKey(name: "key") String? key,
      @JsonKey(name: "site") String? site,
      @JsonKey(name: "type") String? type,
      @JsonKey(name: "official") bool? official,
      @JsonKey(name: "id") String? id});
}

/// @nodoc
class __$$YoutubeEntityImplCopyWithImpl<$Res>
    extends _$YoutubeEntityCopyWithImpl<$Res, _$YoutubeEntityImpl>
    implements _$$YoutubeEntityImplCopyWith<$Res> {
  __$$YoutubeEntityImplCopyWithImpl(
      _$YoutubeEntityImpl _value, $Res Function(_$YoutubeEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? key = freezed,
    Object? site = freezed,
    Object? type = freezed,
    Object? official = freezed,
    Object? id = freezed,
  }) {
    return _then(_$YoutubeEntityImpl(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      key: freezed == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String?,
      site: freezed == site
          ? _value.site
          : site // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      official: freezed == official
          ? _value.official
          : official // ignore: cast_nullable_to_non_nullable
              as bool?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$YoutubeEntityImpl implements _YoutubeEntity {
  const _$YoutubeEntityImpl(
      {@JsonKey(name: "name") required this.name,
      @JsonKey(name: "key") required this.key,
      @JsonKey(name: "site") required this.site,
      @JsonKey(name: "type") required this.type,
      @JsonKey(name: "official") required this.official,
      @JsonKey(name: "id") required this.id});

  @override
  @JsonKey(name: "name")
  final String? name;
  @override
  @JsonKey(name: "key")
  final String? key;
  @override
  @JsonKey(name: "site")
  final String? site;
  @override
  @JsonKey(name: "type")
  final String? type;
  @override
  @JsonKey(name: "official")
  final bool? official;
  @override
  @JsonKey(name: "id")
  final String? id;

  @override
  String toString() {
    return 'YoutubeEntity(name: $name, key: $key, site: $site, type: $type, official: $official, id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$YoutubeEntityImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.key, key) || other.key == key) &&
            (identical(other.site, site) || other.site == site) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.official, official) ||
                other.official == official) &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, name, key, site, type, official, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$YoutubeEntityImplCopyWith<_$YoutubeEntityImpl> get copyWith =>
      __$$YoutubeEntityImplCopyWithImpl<_$YoutubeEntityImpl>(this, _$identity);
}

abstract class _YoutubeEntity implements YoutubeEntity {
  const factory _YoutubeEntity(
      {@JsonKey(name: "name") required final String? name,
      @JsonKey(name: "key") required final String? key,
      @JsonKey(name: "site") required final String? site,
      @JsonKey(name: "type") required final String? type,
      @JsonKey(name: "official") required final bool? official,
      @JsonKey(name: "id") required final String? id}) = _$YoutubeEntityImpl;

  @override
  @JsonKey(name: "name")
  String? get name;
  @override
  @JsonKey(name: "key")
  String? get key;
  @override
  @JsonKey(name: "site")
  String? get site;
  @override
  @JsonKey(name: "type")
  String? get type;
  @override
  @JsonKey(name: "official")
  bool? get official;
  @override
  @JsonKey(name: "id")
  String? get id;
  @override
  @JsonKey(ignore: true)
  _$$YoutubeEntityImplCopyWith<_$YoutubeEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
