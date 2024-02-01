import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:movie_app/feature/featue_api/data/data_Source/firestore/firestore_data_source.dart';
import 'package:movie_app/feature/featue_api/data/model/firestore_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'firestore_data_source_impl.g.dart';

class FireStoreDataSourceImpl implements FireStoreDataSource {
  final movieRef =
      FirebaseFirestore.instance.collection("movie_app").withConverter(
            fromFirestore: FireStoreModel.fromFirestore,
            toFirestore: (FireStoreModel storeModel, options) =>
                storeModel.toFirestore(),
          );
  @override
  Future<void> createCollection(FireStoreModel fireStoreModel) async {
    final movieDoc = movieRef.doc(fireStoreModel.id.toString());
    await movieDoc.set(fireStoreModel);
  }

  @override
  Stream<QuerySnapshot<FireStoreModel>> getCollection() {
    return movieRef.snapshots();
  }

  @override
  Future<void> deleteCollection(String id) async {
    await movieRef.doc(id).delete();
  }
}

@riverpod
FireStoreDataSource fireStoreDataSource(FireStoreDataSourceRef ref) {
  return FireStoreDataSourceImpl();
}
