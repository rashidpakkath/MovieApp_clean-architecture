import 'dart:math';

import 'package:dio/dio.dart';
import 'package:movie_app/feature/featue_api/data/data_Source/api_services_datasource.dart';
import 'package:movie_app/feature/featue_api/data/model/movie_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'api_services_datasource_impl.g.dart';

class ApiServcesDatasourceImpl implements ApiServcesDatasource {
  final Dio dio = Dio();
  // static const link=

  @override
  Future<List<MovieModel>?> getMovie() async {
    try {
      dio.options.headers["Authorization"] =
          'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIxZjc5NGJiODEzNmYwMGY5N2I2NTBlMmU5MGM3ODA5NiIsInN1YiI6IjY1ODI2YmEwZTIxMDIzMTY0ZWYzZGMwNSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.fL3l9u15M0_ePKanxGZRI8hfVgIBVMUBb1Do24AtXFA';
      final response =
          await dio.get('https://api.themoviedb.org/3/discover/movie');
      if (response.statusCode == 200) {
        final data = response.data;

        final movies = <MovieModel>[];

        for (final result in data['results']) {
          movies.add(MovieModel.fromJson(result));
        }
        return movies;
      }
      return null;
    } catch (e) {}
    return null;
  }
}

@riverpod
ApiServcesDatasource apiServcesDatasource(ApiServcesDatasourceRef ref) {
  return ApiServcesDatasourceImpl();
}
