import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_app/feature/featue_api/domain/entity/model_entity.dart';

part 'movie_provider_state.freezed.dart';

@freezed
class MovieProviderState with _$MovieProviderState {
  factory MovieProviderState({
    required List<MovieEntity>? getMoviesNewRelease,
    required List<MovieEntity>? getMovieTopRated,
    required List<MovieEntity>? getMoviePopular,
    required List<MovieEntity>? getMovieUpcoming,
  }) = _MovieProviderState;
}
