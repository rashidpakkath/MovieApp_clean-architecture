import 'package:flutter/cupertino.dart';
import 'package:movie_app/feature/featue_api/data/data_Source/firestore_data_source.dart';
import 'package:movie_app/feature/featue_api/data/data_Source/firestore_data_source_impl.dart';
import 'package:movie_app/feature/featue_api/data/model/firestore_model.dart';
import 'package:movie_app/feature/featue_api/domain/entity/model_entity.dart';
import 'package:movie_app/feature/featue_api/domain/rerository/firestore_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'firestore_repository_impl.g.dart';

class FireStoreRepositoryImpl implements FireStoreRepository {
  final FireStoreDataSource dataSource;
  FireStoreRepositoryImpl({required this.dataSource});

  @override
  Future<void> createCollection(MovieEntity storeModel) async {
    final model = FireStoreModel(
      id: storeModel.id,
      title: storeModel.title,
      overview: storeModel.overview,
      releaseDate: storeModel.releaseDate,
      posterPath: storeModel.posterPath,
      voteAverage: storeModel.voteAverage,
      originalLanguage: storeModel.originalLanguage,
      backdropPath: storeModel.backdropPath,
    );
    await dataSource.createCollection(model);
  }

  @override
  Stream<List<MovieEntity>> getCollection() async* {
    final details = dataSource.getCollection();
    await for (var snapshop in details) {
      final docs = snapshop.docs;
      yield [
        for (var model in docs)
          MovieEntity(
            id: model.data().id,
            title: model.data().title,
            overview: model.data().overview,
            releaseDate: model.data().releaseDate,
            posterPath: model.data().posterPath,
            voteAverage: model.data().voteAverage,
            originalLanguage: model.data().originalLanguage,
            backdropPath: model.data().backdropPath,
          ),
      ];
    }
  }
}

@riverpod
FireStoreRepository fireStoreRepository(FireStoreRepositoryRef ref) {
  return FireStoreRepositoryImpl(
      dataSource: ref.watch(fireStoreDataSourceProvider));
}
