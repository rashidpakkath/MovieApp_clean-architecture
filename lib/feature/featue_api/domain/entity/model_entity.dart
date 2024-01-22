import 'package:freezed_annotation/freezed_annotation.dart';
part 'model_entity.freezed.dart';

@freezed
class MovieEntity with _$MovieEntity {
  factory MovieEntity({
    required String title,
    required String overview,
    @JsonKey(name: 'release_date') required String releaseDate,
    @JsonKey(name: 'poster_path') required String posterPath,
  }) = _MovieEntity;
}
