import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/core/objectbox/newrelease_objectbox.dart';
import 'package:movie_app/core/objectbox/popular_objectbox.dart';
import 'package:movie_app/core/objectbox/toprated_objectbox.dart';
import 'package:movie_app/core/objectbox/upcoming_objectbox.dart';
import 'package:movie_app/core/router/router.dart';
import 'package:movie_app/core/theme/light_theme.dart';
import 'package:movie_app/firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MovieObjectBox.create();
  await MovieObjectBoxUpcoming.create();
  await MovieObjectBoxToprated.create();
  await MovieObjectBoxPopular.create();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: ref.watch(lightThemeProvider),
      routerConfig: ref.watch(routerProvider),
    );
  }
}
