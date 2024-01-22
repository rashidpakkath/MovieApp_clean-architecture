import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/core/constants/login_constans.dart';
import 'package:movie_app/core/theme/app_theme.dart';
import 'package:movie_app/feature/feature_create/presentation/widgets/shape_widget.dart';

class ShapeWidgetRight extends ConsumerWidget {
  const ShapeWidgetRight({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = AppTheme.of(context).colors;
    final space = AppTheme.of(context).spaces;
    final data = ref.watch(loginConstansProvider);
    final typography = AppTheme.of(context).typography;
    return SizedBox(
      height: space.space_800 * 8,
      width: space.space_800 * 5,
      child: CustomPaint(
        size: Size(MediaQuery.sizeOf(context).width,
            (MediaQuery.sizeOf(context).width * 1.3333333333333333).toDouble()),
        painter: ShapeCustomeWidgetRight(),
        child: Column(
          children: [
            SizedBox(
              height: space.space_400 * 3,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsets.only(right: space.space_100 / 2),
                  child: Text(
                    data.singin,
                    style: typography.h800,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
