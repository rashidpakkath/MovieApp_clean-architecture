import 'package:movie_app/feature/featue_api/domain/entity/model_entity.dart';

abstract class ApiRepository {
  Future<List<MovieEntity>?> getMovies();
  Future<List<MovieEntity>?> getMoviesTopRated();
  Future<List<MovieEntity>?> getMoviesPopular();
  Future<List<MovieEntity>?> getMoviesUpcoming();
}
