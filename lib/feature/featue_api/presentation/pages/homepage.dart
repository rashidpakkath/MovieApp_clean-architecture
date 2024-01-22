import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/core/constants/login_constans.dart';
import 'package:movie_app/core/theme/app_theme.dart';
import 'package:movie_app/feature/featue_api/presentation/provaider/movie_provaider.dart';
import 'package:movie_app/feature/featue_api/presentation/widgets/carousel_slider_widget.dart';
import 'package:movie_app/feature/feature_create/presentation/provider/auth_provaider.dart';

class HomePage extends ConsumerWidget {
  static const routePath = '/';
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = AppTheme.of(context).colors;
    final space = AppTheme.of(context).spaces;
    final data = ref.watch(loginConstansProvider);
    final typography = AppTheme.of(context).typography;
    return Scaffold(
        appBar: AppBar(
          title: Text(data.homePage),
          actions: [
            ElevatedButton(
              onPressed: () {
                ref.read(authenticationProvider(context).notifier).logout();
              },
              child: Text(data.logOut),
            ),
          ],
        ),
        body: ref.watch(movieProvaiderProvider) == null
            ? Text('NO DATA')
            : switch (ref.watch(movieProvaiderProvider)) {
                AsyncData(:final value) => CarouselSliderWidget(
                    movieData: value!, itemCount: value.length),
                AsyncError(:final error, :final stackTrace) =>
                  const Text('error'),
                _ => const Center(
                    child: CircularProgressIndicator(),
                  )
              });
  }
}
