import 'package:flutter/material.dart';
import 'package:movie_app/core/theme/app_theme.dart';

class TitleWidget extends StatelessWidget {
  final String text;
  const TitleWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    final colors = AppTheme.of(context).colors;
    final space = AppTheme.of(context).spaces;
    final typography = AppTheme.of(context).typography;
    return Container(
      width: MediaQuery.sizeOf(context).width / 1.05,
      height: space.space_500 * 1.5,
      decoration: BoxDecoration(
        color: colors.secondary.withOpacity(.4),
        borderRadius: BorderRadius.circular(
          space.space_150,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text,
            textAlign: TextAlign.center,
            style: typography.h900.copyWith(
              fontSize: space.space_300,
            ),
          ),
        ],
      ),
    );
  }
}
