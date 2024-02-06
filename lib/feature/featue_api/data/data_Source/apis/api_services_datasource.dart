import 'package:movie_app/feature/featue_api/data/model/movie_model.dart';
import 'package:movie_app/feature/featue_api/data/model/youtube_api_model.dart';

abstract class ApiServcesDatasource {
  Future<List<MovieModel>?> getMovie();
  Future<List<MovieModel>?> getMovieTopRated();
  Future<List<MovieModel>?> getMoviePopular();
  Future<List<MovieModel>?> getMovieUpcoming();
  Future<List<MovieModel>?> searchMovie(String movieName);
  Future<TrailerModel> getYoutube(String id);
}
