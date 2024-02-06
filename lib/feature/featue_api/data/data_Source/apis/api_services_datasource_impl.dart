import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:movie_app/core/constants/api_constance.dart';
import 'package:movie_app/feature/featue_api/data/data_Source/apis/api_services_datasource.dart';
import 'package:movie_app/feature/featue_api/data/model/firestore_model.dart';
import 'package:movie_app/feature/featue_api/data/model/movie_model.dart';
import 'package:movie_app/feature/featue_api/data/model/youtube_api_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'api_services_datasource_impl.g.dart';

class ApiServcesDatasourceImpl implements ApiServcesDatasource {
  final Dio dio = Dio();
  static const link = ApiConstance.urlLink;
  static const linkTopRated = ApiConstance.urlLinkTop;
  static const linkPopular = ApiConstance.urlLinkPopular;
  static const linkUpcoming = ApiConstance.urlLinkUpcoming;
  static const searchMovies = ApiConstance.searchMovie;
  static const tocken = ApiConstance.tocken;

  @override
  Future<List<MovieModel>?> getMovie() async {
    try {
      dio.options.headers["Authorization"] = tocken;
      final response = await dio.get(link);
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

  @override
  Future<List<MovieModel>?> getMovieTopRated() async {
    try {
      dio.options.headers["Authorization"] = tocken;
      final response = await dio.get(linkTopRated);
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

  @override
  Future<List<MovieModel>?> getMoviePopular() async {
    try {
      dio.options.headers["Authorization"] = tocken;
      final response = await dio.get(linkPopular);
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

  @override
  Future<List<MovieModel>?> getMovieUpcoming() async {
    try {
      dio.options.headers["Authorization"] = tocken;
      final response = await dio.get(linkUpcoming);
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

  @override
  Future<List<MovieModel>?> searchMovie(String movieName) async {
    try {
      dio.options.headers["Authorization"] = tocken;
      final response = await dio.get(searchMovies, queryParameters: {
        "query": movieName,
      });
      if (response.statusCode == 200) {
        final data = response.data;

        final movies = <MovieModel>[];

        for (final result in data['results']) {
          movies.add(MovieModel.fromJson(result));
        }
        return movies;
      }
      return null;
    } catch (e) {
      print(e);
    }
    return null;
  }

  @override
  Future<TrailerModel> getYoutube(String id) async {
    dio.options.headers["Authorization"] = tocken;
    final response = await dio
        .get("https://api.themoviedb.org/3/movie/${id}/videos?language=en-US");

    return TrailerModel.fromJson(response.data);
  }
}

@riverpod
ApiServcesDatasource apiServcesDatasource(ApiServcesDatasourceRef ref) {
  return ApiServcesDatasourceImpl();
}
