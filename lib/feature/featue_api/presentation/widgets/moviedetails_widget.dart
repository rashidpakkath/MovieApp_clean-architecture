import 'package:flutter/material.dart';
import 'package:movie_app/core/theme/app_theme.dart';

class MovieDetailWidget extends StatelessWidget {
  final String year;
  final String rating;
  final String language;
  const MovieDetailWidget(
      {super.key,
      required this.year,
      required this.rating,
      required this.language});

  @override
  Widget build(BuildContext context) {
    final colors = AppTheme.of(context).colors;
    final space = AppTheme.of(context).spaces;
    // final data = ref.watch(loginConstansProvider);
    final typography = AppTheme.of(context).typography;
    return SizedBox(
      width: MediaQuery.sizeOf(context).width / 1.1,
      height: space.space_500,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: space.space_500 * 3,
            height: space.space_400,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(space.space_100),
              color: colors.secondary.withOpacity(.6),
            ),
            child: Center(
              child: Text(
                year,
                style: typography.h600.copyWith(
                  color: colors.secondary,
                ),
              ),
            ),
          ),
          Container(
            width: space.space_500 * 2,
            height: space.space_400,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(space.space_100),
              color: colors.secondary.withOpacity(.6),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.star,
                  color: Colors.yellow,
                ),
                SizedBox(
                  width: space.space_100 / 2,
                ),
                Text(
                  rating,
                  style: typography.h600.copyWith(
                    color: colors.secondary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
