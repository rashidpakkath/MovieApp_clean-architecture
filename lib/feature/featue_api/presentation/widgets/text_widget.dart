import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/core/theme/app_theme.dart';

class TextWidget extends StatelessWidget {
  final String text;
  const TextWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    final space = AppTheme.of(context).spaces;
    final typography = AppTheme.of(context).typography;
    final colors = AppTheme.of(context).colors;
    return Container(
      width: MediaQuery.sizeOf(context).width,
      height: space.space_800,
      child: Padding(
        padding: EdgeInsets.only(left: space.space_200),
        child: Row(
          children: [
            Text(
              text,
              style: typography.h700.copyWith(color: colors.secondary),
            ),
          ],
        ),
      ),
    );
  }
}
