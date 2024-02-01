import 'package:movie_app/feature/featue_api/data/data_Source/firestore_comment/firestore_comment_datasource_impl.dart';
import 'package:movie_app/feature/featue_api/data/data_Source/firestore_comment/firestore_commet_datasource.dart';
import 'package:movie_app/feature/featue_api/data/model/firestore_comment_model.dart';
import 'package:movie_app/feature/featue_api/domain/entity/comment_entity.dart';
import 'package:movie_app/feature/featue_api/domain/rerository/comment_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'comment_repository_impl.g.dart';

class CommentRepositoryImpl implements CommentRepository {
  final CommentFirestoreDataSource dataSource;
  CommentRepositoryImpl({required this.dataSource});
  @override
  Future<void> addComment(CommentEntity commentEntity, String id) async {
    final value = CommentFirestoreModel(
      text: commentEntity.text,
      id: commentEntity.id,
    );

    await dataSource.addComment(value, id);
  }

  @override
  Stream<List<CommentEntity>> getComment(String id) async* {
    final data = dataSource.getcomment(id);
    await for (var snapshop in data) {
      final docs = snapshop.docs;
      yield [
        for (var model in docs)
          CommentEntity(
              text: model.data().text, movieid: model.data().id, id: model.id),
      ];
    }
  }

  @override
  Future<void> deleteComment(String id) async {
    await dataSource.deleteComment(id);
  }
}

@riverpod
CommentRepository commentRepository(CommentRepositoryRef ref) {
  return CommentRepositoryImpl(
    dataSource: ref.watch(commentFirestoreDataSourceProvider),
  );
}
