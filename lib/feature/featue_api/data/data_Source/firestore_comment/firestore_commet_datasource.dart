import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:movie_app/feature/featue_api/data/model/firestore_comment_model.dart';
import 'package:movie_app/feature/featue_api/data/model/firestore_model.dart';

abstract class CommentFirestoreDataSource {
  Future<void> addComment(
    CommentFirestoreModel commentModel,
    String id,
  );
  Future<void> deleteComment(
    String id,
  );
  Stream<QuerySnapshot<CommentFirestoreModel>> getcomment(
    String id,
  );
}
