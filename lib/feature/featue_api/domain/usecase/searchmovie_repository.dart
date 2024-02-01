import 'package:movie_app/core/excepation/Base_excepation.dart';
import 'package:movie_app/feature/featue_api/domain/entity/model_entity.dart';
import 'package:movie_app/feature/featue_api/domain/rerository/api_repository.dart';

final class SearchMovieUsecase {
  final ApiRepository repository;
  SearchMovieUsecase({required this.repository});

  Future<List<MovieEntity>?> call(String movieName) async {
    try {
      return await repository.searchMovie(movieName);
    } catch (e) {
      throw BaseException('Error');
    }
  }
}
