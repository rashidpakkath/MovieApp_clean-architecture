import 'package:objectbox/objectbox.dart';

@Entity()
class ObjectboxEntityToprateModel {
  @Id()
  int id = 0;

  int? movieId;
  String? title;
  String? overview;
  String? releaseDate;
  String? posterPath;
  double? voteAverage;
  String? originalLanguage;
  String? backdropPath;

  ObjectboxEntityToprateModel({
    this.id = 0,
    required this.movieId,
    required this.title,
    required this.overview,
    required this.releaseDate,
    required this.posterPath,
    required this.voteAverage,
    required this.originalLanguage,
    required this.backdropPath,
  });
}
