import 'package:flutter/material.dart';

extension AppThemeExtension on BuildContext {
  // * Theme and ColorScheme Accessors

  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => theme.textTheme;
  ColorScheme get colorScheme => theme.colorScheme;
  TextTheme get primaryTextTheme => theme.primaryTextTheme;

  // * Default TextTheme

  // Display styles
  TextStyle? get h1 => textTheme.displayLarge; // 57.0
  TextStyle? get h2 => textTheme.displayMedium; // 45.0
  TextStyle? get h3 => textTheme.displaySmall; // 36.0

  // Headline styles
  TextStyle? get h4 => textTheme.headlineMedium; // 32.0
  TextStyle? get h5 => textTheme.headlineSmall; // 28.0
  TextStyle? get h6 => textTheme.titleLarge; // 22.0

  // Subtitle styles
  TextStyle? get sub1 => textTheme.titleMedium; // 16.0
  TextStyle? get sub2 => textTheme.titleSmall; // 14.0

  // Body styles
  TextStyle? get body1 => textTheme.bodyLarge; // 16.0
  TextStyle? get body2 => textTheme.bodyMedium; // 14.0

  // Button style
  TextStyle? get button => textTheme.labelLarge; // 14.0

  // * Primary TextTheme

  // Display styles
  TextStyle? get pH1 => primaryTextTheme.displayLarge; // 57.0
  TextStyle? get pH2 => primaryTextTheme.displayMedium; // 45.0
  TextStyle? get pH3 => primaryTextTheme.displaySmall; // 36.0

  // Headline styles
  TextStyle? get pH4 => primaryTextTheme.headlineMedium; // 32.0
  TextStyle? get pH5 => primaryTextTheme.headlineSmall; // 28.0
  TextStyle? get pH6 => primaryTextTheme.titleLarge; // 22.0

  // Subtitle styles
  TextStyle? get pSub1 => primaryTextTheme.titleMedium; // 16.0
  TextStyle? get pSub2 => primaryTextTheme.titleSmall; // 14.0

  // Body styles
  TextStyle? get pBody1 => primaryTextTheme.bodyLarge; // 16.0
  TextStyle? get pBody2 => primaryTextTheme.bodyMedium; // 14.0

  // Button style
  TextStyle? get pButton => primaryTextTheme.labelLarge; // 14.0
}

