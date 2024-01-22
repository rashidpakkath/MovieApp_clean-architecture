import 'package:movie_app/feature/featue_api/data/repository/api_repository_impl.dart';
import 'package:movie_app/feature/featue_api/domain/entity/model_entity.dart';
import 'package:movie_app/feature/featue_api/domain/rerository/api_repository.dart';
import 'package:movie_app/feature/featue_api/domain/usecase/movie_api_usecase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'movie_provaider.g.dart';

@riverpod
class MovieProvaider extends _$MovieProvaider {
  late final ApiRepository repository;

  @override
  Future<List<MovieEntity>?> build() async {
    repository = ref.watch(apiRepositoryProvider);
    return await MovieApiUsecase(repository: repository)();
  }
}
