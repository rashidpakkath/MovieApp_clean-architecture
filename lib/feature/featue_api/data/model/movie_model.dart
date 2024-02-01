import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';
part 'movie_model.freezed.dart';
part 'movie_model.g.dart';

@freezed
class MovieModel with _$MovieModel {
  factory MovieModel({
    required int id,
    required String title,
    required String overview,
    @JsonKey(name: 'release_date') required String? releaseDate,
    @JsonKey(name: 'poster_path') required String? posterPath,
    @JsonKey(name: 'backdrop_path') required String? backdropPath,
    @JsonKey(name: 'adult') required bool adult,
    @JsonKey(name: 'genre_ids') required List<int> genreIds,
    @JsonKey(name: 'original_language') required String? originalLanguage,
    @JsonKey(name: 'original_title') required String? originalTitle,
    required double popularity,
    @JsonKey(name: 'video') required bool video,
    @JsonKey(name: 'vote_average') required double voteAverage,
    @JsonKey(name: 'vote_count') required int voteCount,
  }) = _MovieModel;
  factory MovieModel.fromJson(Map<String, Object?> json) =>
      _$MovieModelFromJson(json);
}

MovieModel moviesFromJson(String str) {
  return MovieModel.fromJson(jsonDecode(str));
}
