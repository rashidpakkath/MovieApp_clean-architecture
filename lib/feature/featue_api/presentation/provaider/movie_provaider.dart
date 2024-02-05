import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/core/excepation/Base_excepation.dart';
import 'package:movie_app/core/utils/snacbar_utils.dart';
import 'package:movie_app/feature/featue_api/data/repository/api_repository_impl.dart';
import 'package:movie_app/feature/featue_api/data/repository/comment_repository_impl.dart';
import 'package:movie_app/feature/featue_api/data/repository/firestore_repository_impl.dart';
import 'package:movie_app/feature/featue_api/data/repository/objectbox_repository_impl.dart';
import 'package:movie_app/feature/featue_api/domain/entity/comment_entity.dart';
import 'package:movie_app/feature/featue_api/domain/entity/model_entity.dart';
import 'package:movie_app/feature/featue_api/domain/usecase/comment_usecase.dart';
import 'package:movie_app/feature/featue_api/domain/usecase/delete_usecase.dart';
import 'package:movie_app/feature/featue_api/domain/usecase/firesotre_get_usecaase.dart';
import 'package:movie_app/feature/featue_api/domain/usecase/firestore_usecase.dart';
import 'package:movie_app/feature/featue_api/domain/usecase/get_comment_usecase.dart';
import 'package:movie_app/feature/featue_api/domain/usecase/movie_api_usecase.dart';
import 'package:movie_app/feature/featue_api/domain/usecase/movie_toprated_api_uescase.dart';
import 'package:movie_app/feature/featue_api/domain/usecase/movie_upcoming_usecase.dart';
import 'package:movie_app/feature/featue_api/domain/usecase/popular_movies_usecase.dart';
import 'package:movie_app/feature/featue_api/domain/usecase/searchmovie_repository.dart';
import 'package:movie_app/feature/featue_api/presentation/provaider/movie_provider_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'movie_provaider.g.dart';

@riverpod
class MovieProvaider extends _$MovieProvaider {
  final PageController pageController = PageController();
  final TextEditingController searchController = TextEditingController();
  final TextEditingController commentTextController = TextEditingController();
  @override
  Future<MovieProviderState> build() async {
    final repository = ref.watch(apiRepositoryProvider);
    final localRepository = ref.watch(objectBoxRepositoryProvider);
    final results = await Future.wait(
      [
        MovieApiUsecase(
          apiRepo: repository,
          localStorageRepo: localRepository,
        )(),
        MovieTopRatedApiUsecase(
          apiRepo: repository,
          localStorageRepo: localRepository,
        )(),
        PopularMoviesUsecase(
          apiRepo: repository,
          localStorageRepo: localRepository,
        )(),
        UpcomingMovieUsecase(
          apiRepo: repository,
          localStorageRepo: localRepository,
        )(),
      ],
    );
    return MovieProviderState(
      searchMovie: null,
      getMoviesNewRelease: results[0],
      getMovieTopRated: results[1],
      getMoviePopular: results[2],
      getMovieUpcoming: results[3],
    );
  }

  Future<void> searchMovie(String nameMovie, BuildContext context) async {
    try {
      final data = await SearchMovieUsecase(
          repository: ref.watch(apiRepositoryProvider))(nameMovie);
      state = AsyncValue.data(
        state.value!.copyWith(searchMovie: data),
      );
    } on BaseException catch (e) {
      Future.sync(() => SnackbarUtils.showMessage(context, e.message));
    }
  }

  Future<void> createFireStoreCollection(MovieEntity entity) {
    return FireStoreUsecase(repository: ref.watch(fireStoreRepositoryProvider))(
        entity);
  }

  Future<void> addCommentCollection(CommentEntity entity, String id) {
    return CommentUsecase(repository: ref.watch(commentRepositoryProvider))(
        entity, id);
  }

  Future<void> deleteFireStoreDocs(String id) {
    return DeleteUsecase(repository: ref.watch(fireStoreRepositoryProvider))(
        id);
  }

  Future<void> deleteCommentDocs(String id) {
    return DeleteUsecase(repository: ref.watch(fireStoreRepositoryProvider))(
        id);
  }

  Stream<List<MovieEntity>> getFireStoreCollection() {
    return FireStoreGetUsecase(
        repository: ref.watch(fireStoreRepositoryProvider))();
  }

  Stream<List<CommentEntity>> getCommentCollection(String id) {
    return GetCommentUsecase(repository: ref.watch(commentRepositoryProvider))(
        id);
  }
}

final selected = StateProvider((ref) => 0);
