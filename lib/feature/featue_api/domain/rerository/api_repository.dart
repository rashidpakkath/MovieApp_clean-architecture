

import 'package:movie_app/feature/featue_api/domain/entity/model_entity.dart';

abstract class ApiRepository{
  Future <List<MovieEntity>?>getMovies();
}