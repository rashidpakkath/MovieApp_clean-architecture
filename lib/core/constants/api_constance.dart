import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'api_constance.g.dart';

final class ApiConstance {
  final String urlLink = 'https://api.themoviedb.org/3/discover/movie';
  final String tocken =
      'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIxZjc5NGJiODEzNmYwMGY5N2I2NTBlMmU5MGM3ODA5NiIsInN1YiI6IjY1ODI2YmEwZTIxMDIzMTY0ZWYzZGMwNSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.fL3l9u15M0_ePKanxGZRI8hfVgIBVMUBb1Do24AtXFA';
}

@riverpod
ApiConstance apiConstance(ApiConstanceRef ref) {
  return ApiConstance();
}
