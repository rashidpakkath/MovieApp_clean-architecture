import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/core/constants/login_constans.dart';
import 'package:movie_app/core/theme/app_theme.dart';
import 'package:movie_app/feature/feature_create/presentation/pages/phone_signup_page.dart';
import 'package:movie_app/feature/feature_create/presentation/pages/pin_snakbar_page.dart';
import 'package:movie_app/feature/feature_create/presentation/pages/signup_page.dart';
import 'package:movie_app/feature/feature_create/presentation/provider/auth_provaider.dart';
import 'package:movie_app/feature/feature_create/presentation/widgets/login_button_widget.dart';
import 'package:movie_app/feature/feature_create/presentation/widgets/shape_widget.dart';
import 'package:movie_app/feature/feature_create/presentation/widgets/textfield_widget.dart';

class PhoneWidgetSignup extends ConsumerWidget {
  const PhoneWidgetSignup({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dataController = ref.read(authenticationProvider(context).notifier);
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
        painter: ShapeCustomeWidgetSingupRight(),
        child: Column(
          children: [
            SizedBox(
              height: space.space_400 * 3,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  data.singin,
                  style: typography.h800.copyWith(color: colors.textSubtle),
                ),
                SizedBox(
                  width: space.space_400,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  height: space.space_100 / 2,
                  width: space.space_100 * 12.5,
                  color: colors.text,
                ),
                SizedBox(
                  width: space.space_400,
                ),
              ],
            ),
            SizedBox(
              height: space.space_800,
            ),
            TextFieldWidget(
              labelText: data.enterPhone,
              controller: dataController.phoneNumberController,
              iconData: Icon(
                Icons.phone,
                color: colors.text,
              ),
            ),
            SizedBox(
              height: space.space_100,
            ),
            Padding(
              padding: EdgeInsets.only(left: space.space_400),
              child: InkWell(
                onTap: () {
                  context.push(SignUpPage.routePath);
                },
                child: SizedBox(
                  child: Row(
                    children: [
                      Text(data.signIn),
                      SizedBox(
                        width: space.space_100 / 2,
                      ),
                      Text(
                        data.email,
                        style: typography.h600.copyWith(
                            color: colors.text, fontSize: space.space_200),
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: space.space_200,
            ),
            LoginButtonWidget(
              onPressed: () {
                ref
                    .read(authenticationProvider(context).notifier)
                    .signInWithPhone(dataController.phoneNumberController.text);
              },
              buttonText: data.sendCode,
            ),
            // LoginButtonWidget(
            //   onPressed: () {
            //     context.push('/login');
            //   },
            //   buttonText: data.login,
            // ),
          ],
        ),
      ),
    );
  }
}
