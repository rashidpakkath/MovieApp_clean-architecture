import 'package:movie_app/feature/featue_api/data/model/objectbox/objectbox_entiti_toprate_model.dart';
import 'package:movie_app/objectbox.g.dart';
import 'package:objectbox/objectbox.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class MovieObjectBoxPopular {
  static MovieObjectBoxPopular? _instance;

  late final Store store;
  late final Box<ObjectboxEntityPopularModel> movieModelBox;

  MovieObjectBoxPopular._create(this.store) {
    movieModelBox = store.box<ObjectboxEntityPopularModel>();
  }

  static MovieObjectBoxPopular get instance {
    return _instance!;
  }

  static Future<void> create() async {
    if (_instance == null) {
      final docDir = await getApplicationDocumentsDirectory();
      final store = await openStore(directory: join(docDir.path, 'popular'));
      _instance = MovieObjectBoxPopular._create(store);
    }
  }
}
