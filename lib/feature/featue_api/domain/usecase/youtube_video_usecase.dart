import 'package:dio/dio.dart';
import 'package:movie_app/core/excepation/Base_excepation.dart';
import 'package:movie_app/feature/featue_api/domain/entity/youtube_entity.dart';
import 'package:movie_app/feature/featue_api/domain/rerository/api_repository.dart';

final class TrailerUsecase {
  final ApiRepository repository;
  TrailerUsecase({required this.repository});
  Future<List<YoutubeEntity>?> call(String id) async {
    try {
      final videos = await repository.youtubeVideos(id);
      final trialers = videos!
          .where((video) => video.type!.toLowerCase().trim() == 'trailer')
          .toList();
      return trialers;
    } catch (e) {
      throw BaseException(
          'Error while loading \n ${(e is DioException) ? e.type : e}');
    }
  }
}
