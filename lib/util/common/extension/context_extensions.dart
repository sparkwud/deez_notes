// Extension for accessing media query-related properties
import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  MediaQueryData get mediaQuery => MediaQuery.of(this);

  Size get size => mediaQuery.size;
  EdgeInsets get viewInsets => mediaQuery.viewInsets;
  EdgeInsets get viewPadding => mediaQuery.viewPadding;
  EdgeInsets get viewPaddingAndInsets => viewPadding + viewInsets;
  double get devicePixelRatio => mediaQuery.devicePixelRatio;
  Brightness get platformBrightness => mediaQuery.platformBrightness;
  Orientation get orientation => mediaQuery.orientation;

  double get height => size.height;
  double get width => size.width;

  bool get isLandscape => orientation == Orientation.landscape;
  bool get isPortrait => orientation == Orientation.portrait;
  bool get isDarkMode => platformBrightness == Brightness.dark;

  double get topPadding => mediaQuery.padding.top;
  double get bottomPadding => mediaQuery.padding.bottom;
  double get leftPadding => mediaQuery.padding.left;
  double get rightPadding => mediaQuery.padding.right;

  double get topInset => viewInsets.top;
  double get bottomInset => viewInsets.bottom;
  double get leftInset => viewInsets.left;
  double get rightInset => viewInsets.right;

  double get topPaddingAndInset => topPadding + topInset;
  double get bottomPaddingAndInset => bottomPadding + bottomInset;
  double get leftPaddingAndInset => leftPadding + leftInset;
  double get rightPaddingAndInset => rightPadding + rightInset;
}
