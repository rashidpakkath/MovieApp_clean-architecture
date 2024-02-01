import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:movie_app/feature/featue_api/data/data_Source/firestore_comment/firestore_commet_datasource.dart';
import 'package:movie_app/feature/featue_api/data/model/firestore_comment_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'firestore_comment_datasource_impl.g.dart';

class CommentFirestoreDataSourceImpl implements CommentFirestoreDataSource {
  final commentRef =
      FirebaseFirestore.instance.collection('comments').withConverter(
            fromFirestore: CommentFirestoreModel.fromFirestore,
            toFirestore: (CommentFirestoreModel commentModel, options) =>
                commentModel.toFirestore(),
          );
  @override
  Future<void> addComment(CommentFirestoreModel commentModel, String id) async {
    final commentDoc = commentRef.doc();
    await commentDoc.set(commentModel);
  }

  @override
  Stream<QuerySnapshot<CommentFirestoreModel>> getcomment(String id) {
    return commentRef.where("id", isEqualTo: id).snapshots();
  }

  @override
  Future<void> deleteComment(String id) async {
    await commentRef.doc(id).delete();
  }
}

@riverpod
CommentFirestoreDataSource commentFirestoreDataSource(
    CommentFirestoreDataSourceRef ref) {
  return CommentFirestoreDataSourceImpl();
}
