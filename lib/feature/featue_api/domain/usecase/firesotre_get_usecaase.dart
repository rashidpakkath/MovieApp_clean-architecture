import 'package:movie_app/core/excepation/Base_excepation.dart';
import 'package:movie_app/feature/featue_api/domain/entity/model_entity.dart';
import 'package:movie_app/feature/featue_api/domain/rerository/firestore_repository.dart';

final class FireStoreGetUsecase {
  final FireStoreRepository repository;
  FireStoreGetUsecase({required this.repository});

  Stream<List<MovieEntity>> call() {
    try {
      return repository.getCollection();
    } catch (e) {
      throw BaseException('Error');
    }
  }
}
