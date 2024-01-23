import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/core/constants/login_constans.dart';
import 'package:movie_app/core/theme/app_theme.dart';

class PlayTrailerWidget extends ConsumerWidget {
  final String image;
  const PlayTrailerWidget({super.key, required this.image});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = AppTheme.of(context).colors;
    final space = AppTheme.of(context).spaces;
    final data = ref.watch(loginConstansProvider);
    final typography = AppTheme.of(context).typography;
    return Container(
      width: MediaQuery.sizeOf(context).width / 1.1,
      height: space.space_500 * 2.5,
      decoration: BoxDecoration(
        color: colors.secondary,
        borderRadius: BorderRadius.circular(space.space_150),
      ),
      child: Row(
        children: [
          Container(
            width: space.space_500 * 3.5,
            height: space.space_500 * 2.5,
            decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(image),
                  fit: BoxFit.fill,
                ),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(space.space_150),
                  bottomLeft: Radius.circular(space.space_150),
                ),
                color: colors.secondary),
          ),
          Container(
            width: space.space_500 * 5.5,
            height: space.space_500 * 1.5,
            // color: colors.text,
            child: Row(
              children: [
                Icon(
                  Icons.play_circle,
                  size: space.space_500 * 1.5,
                  color: colors.textSubtlest,
                ),
                Text(
                  data.playButton,
                  style: typography.h600.copyWith(color: colors.textSubtle),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
