import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/core/constants/login_constans.dart';
import 'package:movie_app/core/theme/app_theme.dart';
import 'package:movie_app/feature/feature_create/presentation/widgets/textfield_widget.dart';

class MyLoginPage extends ConsumerWidget {
  const MyLoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = AppTheme.of(context).colors;
    final space = AppTheme.of(context).spaces;
    final data = ref.watch(loginConstansProvider);
    return Scaffold(
      backgroundColor: colors.primary,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFieldWidget(
            labelText: data.enterEmail,
            iconData: Icon(
              Icons.email,
              color: colors.text,
            ),
          ),
          TextFieldWidget(
            labelText: data.password,
            iconData: Icon(
              Icons.lock,
              color: colors.text,
            ),
          ),
        ],
      ),
    );
  }
}
