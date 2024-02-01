import 'package:movie_app/core/excepation/Base_excepation.dart';
import 'package:movie_app/feature/featue_api/domain/rerository/comment_repository.dart';

final class DeletecommentUsecase {
  final CommentRepository repository;
  DeletecommentUsecase({required this.repository});

  Future<void> call(String id) async {
    try {
      return await repository.deleteComment(id);
    } catch (e) {
      throw BaseException('Error');
    }
  }
}
