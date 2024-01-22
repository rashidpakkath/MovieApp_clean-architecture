import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/core/constants/login_constans.dart';
import 'package:movie_app/core/theme/app_theme.dart';
import 'package:movie_app/feature/feature_create/presentation/provider/auth_provaider.dart';
import 'package:movie_app/feature/feature_create/presentation/widgets/textfield_widget.dart';

class SnakbarWidget extends ConsumerWidget {
  const SnakbarWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dataController = ref.read(authenticationProvider(context).notifier);
    final colors = AppTheme.of(context).colors;
    final space = AppTheme.of(context).spaces;
    final data = ref.watch(loginConstansProvider);
    final typography = AppTheme.of(context).typography;
    return Container(
      height: space.space_500 * 4,
      width: space.space_500 * 4,
      color: colors.secondary,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFieldWidget(
            labelText: data.enterOtp,
            controller: dataController.pinNumberController,
            iconData: Icon(
              Icons.phone,
              color: colors.text,
            ),
          ),
          ElevatedButton(
            onPressed: () {
              dataController.verifyOtp(dataController.pinNumberController.text);
            },
            child: Text(data.submit),
          ),
        ],
      ),
    );
  }
}
