import 'dart:math';

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
    return CurvedNavigationBar(
      backgroundColor: colors.textSubtle,
      color: Colors.white24,
      index: ref.watch(selected),
      onTap: (value) {
        ref
            .read(movieProvaiderProvider.notifier)
            .pageController
            .jumpToPage(value);
      },
      items: const [
        Icon(
          CupertinoIcons.home,
          size: 30,
          color: Colors.white,
        ),
        Icon(
          CupertinoIcons.heart,
          size: 30,
          color: Colors.white,
        ),
        Icon(
          CupertinoIcons.person,
          size: 30,
          color: Colors.white,
        ),
      ],
    );
  }
}
