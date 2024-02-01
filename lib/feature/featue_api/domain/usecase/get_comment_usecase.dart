import 'package:movie_app/core/excepation/Base_excepation.dart';
import 'package:movie_app/feature/featue_api/domain/entity/comment_entity.dart';
import 'package:movie_app/feature/featue_api/domain/rerository/comment_repository.dart';

final class GetCommentUsecase {
  final CommentRepository repository;
  GetCommentUsecase({required this.repository});

  Stream<List<CommentEntity>> call(String id) {
    try {
      return repository.getComment(id);
    } catch (e) {
      throw BaseException('Error');
    }
  }
}
