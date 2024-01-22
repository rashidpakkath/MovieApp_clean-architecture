import 'package:movie_app/feature/featue_api/data/model/movie_model.dart';

abstract class ApiServcesDatasource {
  Future<List<MovieModel>?> getMovie();
}
