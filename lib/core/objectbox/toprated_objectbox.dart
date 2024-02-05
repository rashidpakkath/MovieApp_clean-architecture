import 'package:movie_app/feature/featue_api/data/model/objectbox/objectbox_entiti_popular_model.dart';
import 'package:movie_app/feature/featue_api/data/model/objectbox/objectbox_entiti_toprate_model.dart';
import 'package:movie_app/objectbox.g.dart';
import 'package:objectbox/objectbox.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class MovieObjectBoxToprated {
  static MovieObjectBoxToprated? _instance;

  late final Store store;
  late final Box<ObjectboxEntityToprateModel> movieModelBox;

  MovieObjectBoxToprated._create(this.store) {
    movieModelBox = store.box<ObjectboxEntityToprateModel>();
  }

  static MovieObjectBoxToprated get instance {
    return _instance!;
  }

  static Future<void> create() async {
    if (_instance == null) {
      final docDir = await getApplicationDocumentsDirectory();
      final store = await openStore(directory: join(docDir.path, 'toprated'));
      _instance = MovieObjectBoxToprated._create(store);
    }
  }
}
