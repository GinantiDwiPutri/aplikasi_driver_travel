import 'package:aplikasi_driver_travel/app/global/color.dart';
import 'package:aplikasi_driver_travel/app/theme/text_theme.dart';
import 'package:flutter/material.dart';

ThemeData themeDataLight = ThemeData.light().copyWith(
    textTheme: textThemeLight,
    appBarTheme: const AppBarTheme(backgroundColor: primaryColor));
ThemeData themeDataDark = ThemeData.dark().copyWith(
    textTheme: textThemeDark,
    appBarTheme: const AppBarTheme(backgroundColor: secondaryColor));
