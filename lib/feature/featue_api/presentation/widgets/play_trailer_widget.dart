import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/core/constants/login_constans.dart';
import 'package:movie_app/core/theme/app_theme.dart';

class PlayTrailerWidget extends ConsumerWidget {
  const PlayTrailerWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = AppTheme.of(context).colors;
    final space = AppTheme.of(context).spaces;
    final data = ref.watch(loginConstansProvider);
    final typography = AppTheme.of(context).typography;
    return Container(
      width: MediaQuery.sizeOf(context).width / 1.05,
      height: space.space_500 * 1.5,
      decoration: BoxDecoration(
        color: colors.secondary,
        borderRadius: BorderRadius.circular(space.space_100),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.play_circle,
            size: space.space_500 * 1.5,
            color: colors.textSubtlest,
          ),
          SizedBox(
            width: space.space_100,
          ),
          Text(
            data.playButton,
            style: typography.h600.copyWith(color: colors.textSubtle),
          ),
        ],
      ),
    );
  }
}
