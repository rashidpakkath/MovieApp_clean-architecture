import 'package:firebase_auth/firebase_auth.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/feature/feature_create/presentation/pages/homepage.dart';
import 'package:movie_app/feature/feature_create/presentation/pages/login_page.dart';
import 'package:movie_app/feature/feature_create/presentation/pages/signup_page.dart';

final router = GoRouter(initialLocation: '/', routes: [
  GoRoute(
    path: HomePage.routePath,
    name: 'homepage',
    builder: (context, state) => const HomePage(),
    redirect: (context, state) {
      final user = FirebaseAuth.instance.currentUser;
      if (user == null || !user.emailVerified) {
        return MyLoginPage.routePath;
      }
      return null;
    },
  ),
  GoRoute(
    path: MyLoginPage.routePath,
    name: 'login',
    builder: (context, state) => const MyLoginPage(),
  ),
  GoRoute(
    path: SignUpPage.routePath,
    name: 'signup',
    builder: (context, state) => const SignUpPage(),
  )
]);
