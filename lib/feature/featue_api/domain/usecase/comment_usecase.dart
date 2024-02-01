import 'package:movie_app/core/excepation/Base_excepation.dart';
import 'package:movie_app/feature/featue_api/domain/entity/comment_entity.dart';
import 'package:movie_app/feature/featue_api/domain/rerository/comment_repository.dart';

final class CommentUsecase {
  final CommentRepository repository;
  CommentUsecase({required this.repository});

  Future<void> call(CommentEntity model, String id) async {
    try {
      return await repository.addComment(model, id);
    } catch (e) {
      throw BaseException('Error');
    }
  }
}
