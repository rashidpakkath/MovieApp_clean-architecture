import 'package:movie_app/feature/featue_api/data/data_Source/objectbox/objectbox_datasource.dart';
import 'package:movie_app/feature/featue_api/data/data_Source/objectbox/objectbox_datasource_impl.dart';
import 'package:movie_app/feature/featue_api/data/model/objectbox/objectbox_entiti_newrelease_model.dart';
import 'package:movie_app/feature/featue_api/data/model/objectbox/objectbox_entiti_popular_model.dart';
import 'package:movie_app/feature/featue_api/data/model/objectbox/objectbox_entiti_toprate_model.dart';
import 'package:movie_app/feature/featue_api/data/model/objectbox/objectbox_entity_model.dart';
import 'package:movie_app/feature/featue_api/domain/entity/model_entity.dart';
import 'package:movie_app/feature/featue_api/domain/rerository/objectbox_repositury.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'objectbox_repository_impl.g.dart';

class ObjectBoxRepositoryImpl implements ObjectBoxRepository {
  final ObjectBoxDataSource dataSource;
  ObjectBoxRepositoryImpl({required this.dataSource});

  @override
  void addAllMovies(List<MovieEntity> movies) {
    final movieModels = [
      for (final movie in movies)
        ObjectboxEntityModel(
          movieId: movie.id,
          title: movie.title,
          overview: movie.overview,
          releaseDate: movie.releaseDate,
          posterPath: movie.posterPath,
          voteAverage: movie.voteAverage,
          originalLanguage: movie.originalLanguage,
          backdropPath: movie.backdropPath,
        )
    ];

    dataSource.addAllMovies(movieModels);
  }

  @override
  void clearAllMovies() {
    dataSource.clearAllMovies();
  }

  @override
  List<MovieEntity> getAllMovies() {
    final models = dataSource.getAllMovies();

    return [
      for (final movieModel in models)
        MovieEntity(
          id: movieModel.movieId!,
          title: movieModel.title ?? '',
          overview: movieModel.overview ?? '',
          releaseDate: movieModel.releaseDate ?? '',
          posterPath: movieModel.posterPath ?? '',
          voteAverage: movieModel.voteAverage ?? 0,
          originalLanguage: movieModel.originalLanguage ?? '',
          backdropPath: movieModel.backdropPath ?? '',
        ),
    ];
  }

  @override
  void addAllMoviesPopular(List<MovieEntity> model) {
    final movieModels = [
      for (final movie in model)
        ObjectboxEntityPopularModel(
          movieId: movie.id,
          title: movie.title,
          overview: movie.overview,
          releaseDate: movie.releaseDate,
          posterPath: movie.posterPath,
          voteAverage: movie.voteAverage,
          originalLanguage: movie.originalLanguage,
          backdropPath: movie.backdropPath,
        )
    ];

    dataSource.addAllMoviesPopular(movieModels);
  }

  @override
  void addAllMoviesToprate(List<MovieEntity> model) {
    final movieModels = [
      for (final movie in model)
        ObjectboxEntityToprateModel(
          movieId: movie.id,
          title: movie.title,
          overview: movie.overview,
          releaseDate: movie.releaseDate,
          posterPath: movie.posterPath,
          voteAverage: movie.voteAverage,
          originalLanguage: movie.originalLanguage,
          backdropPath: movie.backdropPath,
        )
    ];

    dataSource.addAllMoviesToprate(movieModels);
  }

  @override
  void addAllMoviesUpcoming(List<MovieEntity> model) {
    final movieModels = [
      for (final movie in model)
        ObjectboxNewReleaseModel(
          movieId: movie.id,
          title: movie.title,
          overview: movie.overview,
          releaseDate: movie.releaseDate,
          posterPath: movie.posterPath,
          voteAverage: movie.voteAverage,
          originalLanguage: movie.originalLanguage,
          backdropPath: movie.backdropPath,
        )
    ];

    dataSource.addAllMoviesUpcoming(movieModels);
  }

  @override
  void clearAllMoviesPopular() {
    dataSource.clearAllMoviesPopular();
  }

  @override
  void clearAllMoviesToprate() {
    dataSource.clearAllMoviesToprate();
  }

  @override
  void clearAllMoviesUpcoming() {
    dataSource.clearAllMoviesUpcoming();
  }

  @override
  List<MovieEntity> getAllMoviesPopular() {
    final models = dataSource.getAllMoviesPopular();

    return [
      for (final movieModel in models)
        MovieEntity(
          id: movieModel.movieId!,
          title: movieModel.title ?? '',
          overview: movieModel.overview ?? '',
          releaseDate: movieModel.releaseDate ?? '',
          posterPath: movieModel.posterPath ?? '',
          voteAverage: movieModel.voteAverage ?? 0,
          originalLanguage: movieModel.originalLanguage ?? '',
          backdropPath: movieModel.backdropPath ?? '',
        ),
    ];
  }

  @override
  List<MovieEntity> getAllMoviesToprate() {
    final models = dataSource.getAllMoviesToprate();

    return [
      for (final movieModel in models)
        MovieEntity(
          id: movieModel.movieId!,
          title: movieModel.title ?? '',
          overview: movieModel.overview ?? '',
          releaseDate: movieModel.releaseDate ?? '',
          posterPath: movieModel.posterPath ?? '',
          voteAverage: movieModel.voteAverage ?? 0,
          originalLanguage: movieModel.originalLanguage ?? '',
          backdropPath: movieModel.backdropPath ?? '',
        ),
    ];
  }

  @override
  List<MovieEntity> getAllMoviesUpcoming() {
    final models = dataSource.getAllMoviesUpcoming();

    return [
      for (final movieModel in models)
        MovieEntity(
          id: movieModel.movieId!,
          title: movieModel.title ?? '',
          overview: movieModel.overview ?? '',
          releaseDate: movieModel.releaseDate ?? '',
          posterPath: movieModel.posterPath ?? '',
          voteAverage: movieModel.voteAverage ?? 0,
          originalLanguage: movieModel.originalLanguage ?? '',
          backdropPath: movieModel.backdropPath ?? '',
        ),
    ];
  }
}

@riverpod
ObjectBoxRepository objectBoxRepository(ObjectBoxRepositoryRef ref) {
  return ObjectBoxRepositoryImpl(
      dataSource: ref.watch(objectBoxDataSourceProvider));
}
