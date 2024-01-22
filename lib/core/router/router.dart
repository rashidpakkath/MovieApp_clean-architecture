import 'package:firebase_auth/firebase_auth.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/feature/featue_api/presentation/pages/homepage.dart';
import 'package:movie_app/feature/feature_create/presentation/pages/login_page.dart';
import 'package:movie_app/feature/feature_create/presentation/pages/phone_signup_page.dart';
import 'package:movie_app/feature/feature_create/presentation/pages/pin_snakbar_page.dart';
import 'package:movie_app/feature/feature_create/presentation/pages/signup_page.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'router.g.dart';

final _router = GoRouter(
  initialLocation: HomePage.routePath,
  routes: [
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
    ),
    GoRoute(
      path: PhoneSignUpPage.routePath,
      name: 'phone',
      builder: (context, state) => const PhoneSignUpPage(),
    ),
    GoRoute(
      path: SnakbarWidget.routePath,
      name: 'pincode',
      builder: (context, state) => const SnakbarWidget(),
    )
  ],
);
@riverpod
GoRouter router(RouterRef ref) {
  return _router;
}
