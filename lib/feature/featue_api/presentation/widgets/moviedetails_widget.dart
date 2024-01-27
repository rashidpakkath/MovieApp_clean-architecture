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
    return Container(
      width: MediaQuery.sizeOf(context).width / 1.1,
      height: space.space_500,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            year,
            style: typography.h600.copyWith(
              color: colors.secondary,
            ),
          ),
          Row(
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
        ],
      ),
    );
  }
}
