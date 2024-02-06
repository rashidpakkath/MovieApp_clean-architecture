import 'package:movie_app/feature/featue_api/data/repository/api_repository_impl.dart';
import 'package:movie_app/feature/featue_api/domain/entity/youtube_entity.dart';
import 'package:movie_app/feature/featue_api/domain/usecase/youtube_video_usecase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'video_provider.g.dart';

@riverpod
Future<List<YoutubeEntity>?> trailer(TrailerRef ref, String movieId) async {
  return await TrailerUsecase(repository: ref.read(apiRepositoryProvider))(
      movieId);
}
