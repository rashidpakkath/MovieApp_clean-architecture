import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/feature/featue_api/data/repository/api_repository_impl.dart';
import 'package:movie_app/feature/featue_api/domain/usecase/movie_api_usecase.dart';
import 'package:movie_app/feature/featue_api/domain/usecase/movie_toprated_api_uescase.dart';
import 'package:movie_app/feature/featue_api/domain/usecase/movie_upcoming_usecase.dart';
import 'package:movie_app/feature/featue_api/domain/usecase/popular_movies_usecase.dart';
import 'package:movie_app/feature/featue_api/presentation/provaider/movie_provider_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'movie_provaider.g.dart';

@riverpod
class MovieProvaider extends _$MovieProvaider {
  final PageController pageController = PageController();
  final ScrollController scrollController = ScrollController();
  @override
  Future<MovieProviderState> build() async {
    final repository = ref.watch(apiRepositoryProvider);
    final results = await Future.wait(
      [
        MovieApiUsecase(repository: repository)(),
        MovieTopRatedApiUsecase(repository: repository)(),
        PopularMoviesUsecase(repository: repository)(),
        UpcomingMovieUsecase(repository: repository)(),
      ],
    );
    return MovieProviderState(
      getMoviesNewRelease: results[0],
      getMovieTopRated: results[1],
      getMoviePopular: results[2],
      getMovieUpcoming: results[3],
    );
  }
}

final selected = StateProvider((ref) => 0);
