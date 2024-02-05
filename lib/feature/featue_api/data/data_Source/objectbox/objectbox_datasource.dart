import 'package:movie_app/feature/featue_api/data/model/objectbox/objectbox_entiti_newrelease_model.dart';
import 'package:movie_app/feature/featue_api/data/model/objectbox/objectbox_entiti_popular_model.dart';
import 'package:movie_app/feature/featue_api/data/model/objectbox/objectbox_entiti_toprate_model.dart';
import 'package:movie_app/feature/featue_api/data/model/objectbox/objectbox_entity_model.dart';

abstract class ObjectBoxDataSource {
  void addAllMovies(List<ObjectboxEntityModel> model);
  void clearAllMovies();
  List<ObjectboxEntityModel> getAllMovies();

  void addAllMoviesPopular(List<ObjectboxEntityPopularModel> model);
  void clearAllMoviesPopular();
  List<ObjectboxEntityPopularModel> getAllMoviesPopular();

  void addAllMoviesToprate(List<ObjectboxEntityToprateModel> model);
  void clearAllMoviesToprate();
  List<ObjectboxEntityToprateModel> getAllMoviesToprate();

  void addAllMoviesUpcoming(List<ObjectboxNewReleaseModel> model);
  void clearAllMoviesUpcoming();
  List<ObjectboxNewReleaseModel> getAllMoviesUpcoming();
}
