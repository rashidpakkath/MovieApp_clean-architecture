import 'package:movie_app/core/excepation/Base_excepation.dart';
import 'package:movie_app/feature/featue_api/domain/entity/model_entity.dart';
import 'package:movie_app/feature/featue_api/domain/rerository/firestore_repository.dart';

final class FireStoreUsecase {
  final FireStoreRepository repository;
  FireStoreUsecase({required this.repository});

  Future<void> call(MovieEntity model) async {
    try {
      return await repository.createCollection(model);
    } catch (e) {
      throw BaseException('Error');
    }
  }
}
