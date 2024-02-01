import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:movie_app/feature/featue_api/data/model/firestore_model.dart';

abstract class FireStoreDataSource {
  Future<void> createCollection(
    FireStoreModel fireStoreModel,
  );
  Future<void> deleteCollection(
    String id,
  );
  Stream<QuerySnapshot<FireStoreModel>> getCollection();
}
