import 'package:movie_app/core/excepation/Base_excepation.dart';
import 'package:movie_app/feature/featue_api/domain/entity/model_entity.dart';
import 'package:movie_app/feature/featue_api/domain/rerository/firestore_repository.dart';

final class DeleteUsecase {
  final FireStoreRepository repository;
  DeleteUsecase({required this.repository});

  Future<void> call(String id) async {
    try {
      return await repository.deleteCollection(id);
    } catch (e) {
      throw BaseException('Error');
    }
  }
}
