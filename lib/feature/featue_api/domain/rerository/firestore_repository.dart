import 'dart:ffi';

import 'package:movie_app/feature/featue_api/domain/entity/model_entity.dart';

abstract class FireStoreRepository {
  Future<void> createCollection(
    MovieEntity storeModel,
  );
  Stream<List<MovieEntity>> getCollection();
}
