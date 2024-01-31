import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/core/constants/login_constans.dart';
import 'package:movie_app/core/theme/app_theme.dart';

class ProfilePage extends ConsumerWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = AppTheme.of(context).colors;
    final typography = AppTheme.of(context).typography;
    final data = ref.watch(loginConstansProvider);
    return Scaffold(
      backgroundColor: colors.backgroundDanger,
      appBar: AppBar(
        backgroundColor: colors.backgroundDanger,
        centerTitle: true,
        title: Text(
          data.profile,
          style: typography.h600.copyWith(color: colors.textSubtlest),
        ),
      ),
    );
  }
}
