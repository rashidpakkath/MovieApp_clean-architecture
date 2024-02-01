import 'package:movie_app/feature/featue_api/domain/entity/comment_entity.dart';

abstract class CommentRepository {
  Future<void> addComment(
    CommentEntity commentEntity,
    String id,
  );
  Future<void> deleteComment(
    String id,
  );
  Stream<List<CommentEntity>> getComment(
    String id,
  );
}
