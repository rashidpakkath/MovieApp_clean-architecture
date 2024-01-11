import 'package:flutter/material.dart';
import 'package:movie_app/core/theme/app_theme.dart';

class TextFieldWidget extends StatelessWidget {
  final String labelText;
  final Icon iconData;
  const TextFieldWidget(
      {super.key, required this.labelText, required this.iconData});

  @override
  Widget build(BuildContext context) {
    final colors = AppTheme.of(context).colors;
    final space = AppTheme.of(context).spaces;
    return Padding(
      padding: EdgeInsets.all(space.space_200),
      child: TextField(
        decoration: InputDecoration(
            fillColor: colors.secondary,
            filled: true,
            labelText: labelText,
            labelStyle: TextStyle(color: colors.textInverse),
            prefixIcon: iconData,
            border: OutlineInputBorder(borderSide: BorderSide.none)),
      ),
    );
  }
}
