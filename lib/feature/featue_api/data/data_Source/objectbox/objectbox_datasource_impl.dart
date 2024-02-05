import 'package:dio/dio.dart';
import 'package:movie_app/core/constants/api_constance.dart';
import 'package:movie_app/core/objectbox/newrelease_objectbox.dart';
import 'package:movie_app/core/objectbox/popular_objectbox.dart';
import 'package:movie_app/core/objectbox/toprated_objectbox.dart';
import 'package:movie_app/core/objectbox/upcoming_objectbox.dart';
import 'package:movie_app/feature/featue_api/data/data_Source/objectbox/objectbox_datasource.dart';
import 'package:movie_app/feature/featue_api/data/model/objectbox/objectbox_entiti_newrelease_model.dart';
import 'package:movie_app/feature/featue_api/data/model/objectbox/objectbox_entiti_popular_model.dart';
import 'package:movie_app/feature/featue_api/data/model/objectbox/objectbox_entiti_toprate_model.dart';
import 'package:movie_app/feature/featue_api/data/model/objectbox/objectbox_entity_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'objectbox_datasource_impl.g.dart';

class ObjectBoxDataSourceImpl implements ObjectBoxDataSource {
  final movieBox = MovieObjectBox.instance.movieModelBox;
  final movieBoxPopular = MovieObjectBoxPopular.instance.movieModelBox;
  final movieBoxToprated = MovieObjectBoxToprated.instance.movieModelBox;
  final movieBoxUpcoming = MovieObjectBoxUpcoming.instance.movieModelBox;

  @override
  void addAllMovies(List<ObjectboxEntityModel> model) async {
    final dio = Dio(BaseOptions(baseUrl: ApiConstance.baseUrl));

    final chacheDirectory =
        '${(await getApplicationDocumentsDirectory()).path}/chached_image';

    for (final movie in model) {
      final posterPathLocation = '$chacheDirectory${movie.posterPath}';
      final backdropPathLocation = '$chacheDirectory${movie.backdropPath}';

      await dio.download(movie.posterPath!, posterPathLocation);
      await dio.download(movie.backdropPath!, backdropPathLocation);

      movie.posterPath = posterPathLocation;
      movie.backdropPath = backdropPathLocation;
      movieBox.put(movie);
    }
  }

  @override
  void clearAllMovies() {
    movieBox.removeAll();
  }

  @override
  List<ObjectboxEntityModel> getAllMovies() {
    return movieBox.getAll();
  }

  @override
  void addAllMoviesPopular(List<ObjectboxEntityPopularModel> model) async {
    final dio = Dio(BaseOptions(baseUrl: ApiConstance.baseUrl));

    final chacheDirectory =
        '${(await getApplicationDocumentsDirectory()).path}/chached_image';

    for (final movie in model) {
      final posterPathLocation = '$chacheDirectory${movie.posterPath}';
      final backdropPathLocation = '$chacheDirectory${movie.backdropPath}';

      await dio.download(movie.posterPath!, posterPathLocation);
      await dio.download(movie.backdropPath!, backdropPathLocation);

      movie.posterPath = posterPathLocation;
      movie.backdropPath = backdropPathLocation;
      movieBoxPopular.put(movie);
    }
  }

  @override
  void addAllMoviesToprate(List<ObjectboxEntityToprateModel> model) async {
    final dio = Dio(BaseOptions(baseUrl: ApiConstance.baseUrl));

    final chacheDirectory =
        '${(await getApplicationDocumentsDirectory()).path}/chached_image';

    for (final movie in model) {
      final posterPathLocation = '$chacheDirectory${movie.posterPath}';
      final backdropPathLocation = '$chacheDirectory${movie.backdropPath}';

      await dio.download(movie.posterPath!, posterPathLocation);
      await dio.download(movie.backdropPath!, backdropPathLocation);
      movie.posterPath = posterPathLocation;
      movie.backdropPath = backdropPathLocation;
      movieBoxToprated.put(movie);
    }
  }

  @override
  void addAllMoviesUpcoming(List<ObjectboxNewReleaseModel> model) async {
    final dio = Dio(BaseOptions(baseUrl: ApiConstance.baseUrl));

    final chacheDirectory =
        '${(await getApplicationDocumentsDirectory()).path}/chached_image';

    for (final movie in model) {
      final posterPathLocation = '$chacheDirectory${movie.posterPath}';
      final backdropPathLocation = '$chacheDirectory${movie.backdropPath}';

      await dio.download(movie.posterPath!, posterPathLocation);
      await dio.download(movie.backdropPath!, backdropPathLocation);

      movie.posterPath = posterPathLocation;
      movie.backdropPath = backdropPathLocation;

      movieBoxUpcoming.put(movie);
    }
  }

  @override
  void clearAllMoviesPopular() {
    movieBoxPopular.removeAll();
  }

  @override
  void clearAllMoviesToprate() {
    movieBoxToprated.removeAll();
  }

  @override
  void clearAllMoviesUpcoming() {
    movieBoxUpcoming.removeAll();
  }

  @override
  List<ObjectboxEntityPopularModel> getAllMoviesPopular() {
    return movieBoxPopular.getAll();
  }

  @override
  List<ObjectboxEntityToprateModel> getAllMoviesToprate() {
    return movieBoxToprated.getAll();
  }

  @override
  List<ObjectboxNewReleaseModel> getAllMoviesUpcoming() {
    return movieBoxUpcoming.getAll();
  }
}

@riverpod
ObjectBoxDataSource objectBoxDataSource(ObjectBoxDataSourceRef ref) {
  return ObjectBoxDataSourceImpl();
}
