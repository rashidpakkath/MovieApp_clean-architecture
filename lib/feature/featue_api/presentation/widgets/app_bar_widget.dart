import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/core/constants/login_constans.dart';
import 'package:movie_app/core/theme/app_theme.dart';

class AppBarWidget extends ConsumerWidget {
  const AppBarWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = AppTheme.of(context).colors;
    final space = AppTheme.of(context).spaces;
    final data = ref.watch(loginConstansProvider);
    final typography = AppTheme.of(context).typography;
    return Container(
      width: MediaQuery.sizeOf(context).width,
      height: space.space_500 * 2.5,
      color: colors.textSubtle,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: space.space_200),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.apps,
              size: space.space_500,
              color: colors.primary,
            ),
            Text(
              data.homePage,
              style: typography.h800.copyWith(color: colors.textSubtlest),
            ),
            CircleAvatar(
              radius: space.space_300,
              backgroundColor: colors.primary,
            ),
          ],
        ),
      ),
    );
  }
}
