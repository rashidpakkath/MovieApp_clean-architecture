import 'package:go_router/go_router.dart';
import 'package:movie_app/feature/feature_create/presentation/pages/login_page.dart';
import 'package:movie_app/feature/feature_create/presentation/pages/signup_page.dart';

final router = GoRouter(initialLocation: '/', routes: [
  GoRoute(
    path: '/',
    name: 'login',
    builder: (context, state) => const MyLoginPage(),
  ),
  GoRoute(
    path: '/signup',
    name: 'signup',
    builder: (context, state) => const SignUpPage(),
  )
]);
