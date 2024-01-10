

import 'package:go_router/go_router.dart';
import 'package:movie_app/feature/feature_create/presentation/pages/login_page.dart';

final router =GoRouter(routes: [
  GoRoute(
    path: '/',
    name: 'login',
    builder: (context, state) =>const MyLoginPage(),
  )
]);