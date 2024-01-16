import 'package:flutter/material.dart';
import 'package:movie_app/core/theme/app_theme.dart';

class TextFieldWidget extends StatelessWidget {
  final String labelText;
  final Icon iconData;
  final TextEditingController controller;
  const TextFieldWidget(
      {super.key,
      required this.labelText,
      required this.iconData,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    final colors = AppTheme.of(context).colors;
    final space = AppTheme.of(context).spaces;
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: space.space_400, vertical: space.space_100),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          fillColor: colors.secondary,
          filled: true,

          labelText: labelText,
          labelStyle: TextStyle(color: colors.textInverse),
          prefixIcon: iconData,

          // border: OutlineInputBorder(
          //   borderSide: BorderSide(color: colors.textSubtle),
          // ),
        ),
      ),
    );
  }
}
