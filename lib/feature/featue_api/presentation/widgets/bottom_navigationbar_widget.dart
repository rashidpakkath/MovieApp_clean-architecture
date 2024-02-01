import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/core/theme/app_theme.dart';
import 'package:movie_app/feature/featue_api/presentation/provaider/movie_provaider.dart';

class BottomNavigationbarWidget extends ConsumerWidget {
  const BottomNavigationbarWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = AppTheme.of(context).colors;
    final space = AppTheme.of(context).spaces;
    return CurvedNavigationBar(
      backgroundColor: colors.backgroundDanger,
      color: colors.primary,
      index: ref.watch(selected),
      onTap: (value) {
        ref
            .read(movieProvaiderProvider.notifier)
            .pageController
            .jumpToPage(value);
      },
      items: [
        Icon(
          CupertinoIcons.home,
          size: space.space_400,
          color: colors.textSubtle,
        ),
        Icon(
          CupertinoIcons.heart,
          size: space.space_400,
          color: colors.textSubtle,
        ),
        Icon(
          CupertinoIcons.person,
          size: space.space_400,
          color: colors.textSubtle,
        ),
      ],
    );
  }
}
