import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/core/constants/login_constans.dart';
import 'package:movie_app/core/theme/app_theme.dart';
import 'package:movie_app/feature/featue_api/presentation/provaider/movie_provaider.dart';
import 'package:movie_app/feature/featue_api/presentation/widgets/app_bar_widget.dart';
import 'package:movie_app/feature/featue_api/presentation/widgets/gridview_widget.dart';

class FavouritePage extends ConsumerWidget {
  const FavouritePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = AppTheme.of(context).colors;
    final typography = AppTheme.of(context).typography;
    final data = ref.watch(loginConstansProvider);

    return Scaffold(
      backgroundColor: colors.backgroundDanger,
      appBar: AppBar(
        backgroundColor: colors.backgroundDanger,
        centerTitle: true,
        title: Text(
          data.favourite,
          style: typography.h600.copyWith(color: colors.textSubtle),
        ),
      ),
      body: StreamBuilder(
          stream: ref
              .read(movieProvaiderProvider.notifier)
              .getFireStoreCollection(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return GridViewWidget(
                entity: snapshot.data!,
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}
