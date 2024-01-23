import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/core/theme/app_theme.dart';

class ButtonsWidget extends StatelessWidget {
  final String text;
  final Color color;
  final Icon icons;
  const ButtonsWidget(
      {super.key,
      required this.color,
      required this.text,
      required this.icons});

  @override
  Widget build(BuildContext context) {
    final space = AppTheme.of(context).spaces;
    return ElevatedButton.icon(
      onPressed: () {},
      icon: icons,
      label: Text(text),
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        minimumSize: Size(space.space_500 * 4.5, space.space_500 * 1.3),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(space.space_500),
        ),
      ),
    );
  }
}
