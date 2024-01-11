import 'package:flutter/material.dart';
import 'package:movie_app/core/theme/app_theme.dart';

class MyLoginPage extends StatelessWidget {
  const MyLoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = AppTheme.of(context).colors;
    final space = AppTheme.of(context).spaces;
    return Scaffold(
      backgroundColor: colors.primary,
    );
  }
}
