import 'package:movie_app/feature/featue_api/domain/entity/model_entity.dart';

abstract class ObjectBoxRepository {
  void addAllMovies(List<MovieEntity> model);
  void clearAllMovies();
  List<MovieEntity> getAllMovies();

  void addAllMoviesPopular(List<MovieEntity> model);
  void clearAllMoviesPopular();
  List<MovieEntity> getAllMoviesPopular();

  void addAllMoviesToprate(List<MovieEntity> model);
  void clearAllMoviesToprate();
  List<MovieEntity> getAllMoviesToprate();

  void addAllMoviesUpcoming(List<MovieEntity> model);
  void clearAllMoviesUpcoming();
  List<MovieEntity> getAllMoviesUpcoming();
}
