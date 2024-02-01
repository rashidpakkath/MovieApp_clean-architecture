import 'package:freezed_annotation/freezed_annotation.dart';
part 'comment_entity.freezed.dart';

@freezed
class CommentEntity with _$CommentEntity {
  factory CommentEntity({
    required String movieid,
    required String text,
    required String id,
  }) = _CommentEntity;
}
