import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'firestore_comment_model.freezed.dart';
part 'firestore_comment_model.g.dart';

@freezed
class CommentFirestoreModel with _$CommentFirestoreModel {
  const CommentFirestoreModel._();

  factory CommentFirestoreModel({
    required String id,
    required String text,
  }) = _CommentFirestoreModel;

  factory CommentFirestoreModel.fromJson(Map<String, dynamic> json) =>
      _$CommentFirestoreModelFromJson(json);

  factory CommentFirestoreModel.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data()!;
    return CommentFirestoreModel.fromJson(data);
  }

  Map<String, dynamic> toFirestore() {
    return toJson();
  }
}
