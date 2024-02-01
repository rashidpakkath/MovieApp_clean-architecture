import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/core/constants/login_constans.dart';
import 'package:movie_app/core/theme/app_theme.dart';

class ProfilePhotoWidget extends ConsumerWidget {
  const ProfilePhotoWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = AppTheme.of(context).colors;
    final space = AppTheme.of(context).spaces;
    final data = ref.watch(loginConstansProvider);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: space.space_500 * 3,
          width: space.space_500 * 3,
          decoration: BoxDecoration(
            color: colors.secondary,
            borderRadius: BorderRadius.circular(space.space_900 * 2),
            image: DecorationImage(
              image: AssetImage(data.profileImage),
            ),
          ),
        )
      ],
    );
  }
}
