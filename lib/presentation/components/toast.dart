import 'package:deez_notes/util/theme/colors.dart';
import 'package:deez_notes/util/theme/typography.dart';
import 'package:flutter/material.dart';

extension ContextEx on BuildContext {
  void showToast(
    String message, {
    bool isError = false,
  }) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: AppTypography.description.copyWith(color: AppColors.white),
        ),
        backgroundColor: isError ? AppColors.error : AppColors.success,
        duration: const Duration(seconds: 2),
      ),
    );
  }
}

// extension AppRouterEx on AppRouter {
//   BuildContext get context => navigatorKey.currentContext!;
// }
