import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'firestore_model.freezed.dart';
part 'firestore_model.g.dart';

@freezed
class FireStoreModel with _$FireStoreModel {
  const FireStoreModel._();
  factory FireStoreModel({
    required int id,
    required String title,
    required String overview,
    @JsonKey(name: 'release_date') required String releaseDate,
    @JsonKey(name: 'poster_path') required String posterPath,
    @JsonKey(name: 'vote_average') required double voteAverage,
    @JsonKey(name: 'original_language') required String originalLanguage,
    @JsonKey(name: 'backdrop_path') required String backdropPath,
  }) = _FireStoreModel;
  factory FireStoreModel.fromJson(Map<String, dynamic> json) =>
      _$FireStoreModelFromJson(json);
  factory FireStoreModel.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data()!;
    return FireStoreModel.fromJson(data);
  }
  Map<String, dynamic> toFirestore() {
    return toJson();
  }
}
