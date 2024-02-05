import 'package:movie_app/feature/featue_api/data/model/objectbox/objectbox_entity_model.dart';
import 'package:movie_app/objectbox.g.dart';
import 'package:objectbox/objectbox.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class MovieObjectBox {
  static MovieObjectBox? _instance;

  late final Store store;
  late final Box<ObjectboxEntityModel> movieModelBox;

  MovieObjectBox._create(this.store) {
    movieModelBox = store.box<ObjectboxEntityModel>();
  }

  static MovieObjectBox get instance {
    return _instance!;
  }

  static Future<void> create() async {
    if (_instance == null) {
      final docDir = await getApplicationDocumentsDirectory();
      final store = await openStore(directory: join(docDir.path, 'movie'));
      _instance = MovieObjectBox._create(store);
    }
  }
}
