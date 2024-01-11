import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/core/constants/login_constans.dart';
import 'package:movie_app/core/theme/app_theme.dart';
import 'package:movie_app/feature/feature_create/presentation/widgets/login_button_widget.dart';
import 'package:movie_app/feature/feature_create/presentation/widgets/shape_widget.dart';
import 'package:movie_app/feature/feature_create/presentation/widgets/textfield_widget.dart';

class ShapeWidget extends ConsumerWidget {
  const ShapeWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = AppTheme.of(context).colors;
    final space = AppTheme.of(context).spaces;
    final data = ref.watch(loginConstansProvider);
    final typography = AppTheme.of(context).typography;
    return SizedBox(
      height: space.space_800 * 6.5,
      width: space.space_800 * 5.5,
      child: CustomPaint(
        size: Size(MediaQuery.sizeOf(context).width,
            (MediaQuery.sizeOf(context).width * 1.3333333333333333).toDouble()),
        painter: ShapeCustomWiddget(),
        child: Column(
          children: [
            SizedBox(
              height: space.space_800,
            ),
            Row(
              children: [
                SizedBox(
                  width: space.space_400,
                ),
                Text(
                  data.login,
                  style: typography.h800.copyWith(color: colors.textSubtle),
                ),
              ],
            ),
            Row(
              children: [
                SizedBox(
                  width: space.space_400,
                ),
                Container(
                  height: space.space_100 / 2,
                  width: space.space_100 * 10.5,
                  color: colors.text,
                ),
              ],
            ),
            SizedBox(
              height: space.space_400,
            ),
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
            Text(
              data.forgetPassword,
              style: typography.h400.copyWith(color: colors.text),
            ),
            SizedBox(
              height: space.space_600,
            ),
            LoginButtonWidget(
              onPressed: () {},
              buttonText: data.login,
            ),
          ],
        ),
      ),
    );
  }
}
