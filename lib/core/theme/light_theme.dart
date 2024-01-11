import 'package:flutter/material.dart';
import 'package:movie_app/core/theme/color_palette.dart';
import 'package:movie_app/core/theme/extention/color_extention.dart';
import 'package:movie_app/core/theme/extention/space_extention.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'light_theme.g.dart';

final _lightTheme = ThemeData(brightness: Brightness.light, extensions: [
  AppColorExtension(
    primary: AppColorPalette.blue100,
    secondary: Colors.white,
    text: AppColorPalette.blue400,
    textInverse: AppColorPalette.gray100,
    textSubtle: Colors.black,
    textSubtlest: Colors.red,
    backgroundDanger: Colors.black12,
  ),
  AppSpaceExtension.fromBaseSpace(8),
]);

@riverpod
ThemeData lightTheme(LightThemeRef ref) {
  return _lightTheme;
}
