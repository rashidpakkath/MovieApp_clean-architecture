import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:movie_app/feature/featue_api/data/model/firestore_model.dart';

abstract class FireStoreDataSource {
  Future<void> createCollection(
    FireStoreModel fireStoreModel,
  );
  Stream<QuerySnapshot<FireStoreModel>> getCollection();
}
