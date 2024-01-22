import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:movie_app/core/constants/login_constans.dart';
import 'package:movie_app/core/theme/app_theme.dart';
import 'package:movie_app/feature/feature_create/presentation/widgets/google_container_widget.dart';
import 'package:movie_app/feature/feature_create/presentation/widgets/login_button_widget.dart';
import 'package:movie_app/feature/feature_create/presentation/widgets/login_widgets/shape_login_widget.dart';
import 'package:movie_app/feature/feature_create/presentation/widgets/login_widgets/shape_loginback_widget.dart';
import 'package:movie_app/feature/feature_create/presentation/widgets/phone_signup_widgets/signup_phone_widget.dart';
import 'package:movie_app/feature/feature_create/presentation/widgets/phone_signup_widgets/signup_phoneback_widget.dart';
import 'package:movie_app/feature/feature_create/presentation/widgets/signup_widgets/shape_signup_widget.dart';
import 'package:movie_app/feature/feature_create/presentation/widgets/signup_widgets/shape_signupback_widget.dart';

class PhoneSignUpPage extends HookConsumerWidget {
  static const routePath = '/phone';
  const PhoneSignUpPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = AppTheme.of(context).colors;
    final space = AppTheme.of(context).spaces;
    final textStyle = AppTheme.of(context).typography;
    final data = ref.watch(loginConstansProvider);
    return Scaffold(
      backgroundColor: colors.primary,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: MediaQuery.sizeOf(context).width,
              height: space.space_500,
            ),
            Text(
              data.helloText,
              style: textStyle.h800.copyWith(color: colors.text),
            ),
            Text(
              data.createAccount,
              style: textStyle.h500.copyWith(color: colors.text),
            ),
            SizedBox(
              height: space.space_500,
            ),
            const Stack(
              alignment: Alignment.center,
              children: [
                PhoneWidgetRightSignup(),
                PhoneWidgetSignup(),
              ],
            ),
            SizedBox(
              height: space.space_500,
            ),
            // Text(
            //   data.signUpWith,
            //   style: textStyle.h500.copyWith(color: colors.text),
            // ),
            // const GoogleContainerWidget(),
          ],
        ),
      ),
    );
  }
}
