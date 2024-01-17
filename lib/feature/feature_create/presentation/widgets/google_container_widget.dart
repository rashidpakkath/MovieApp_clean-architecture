import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/core/constants/login_constans.dart';
import 'package:movie_app/core/theme/app_theme.dart';
import 'package:movie_app/feature/feature_create/presentation/provider/auth_provaider.dart';

class GoogleContainerWidget extends ConsumerWidget {
  const GoogleContainerWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = AppTheme.of(context).colors;
    final space = AppTheme.of(context).spaces;
    final data = ref.watch(loginConstansProvider);
    final typography = AppTheme.of(context).typography;
    return InkWell(
      onTap: () {
        ref.read(authenticationProvider(context).notifier).googleSignin();
      },
      child: SizedBox(
        width: space.space_800,
        height: space.space_800,
        child: Image.asset(data.googleImage),
      ),
    );
  }
}
