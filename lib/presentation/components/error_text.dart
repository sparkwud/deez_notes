import 'package:deez_notes/util/theme/colors.dart';
import 'package:deez_notes/util/theme/typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class ErrorText extends StatelessWidget {
  const ErrorText(this.message, {super.key});
  final String message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        message,
        style: AppTypography.title.copyWith(
          color: AppColors.description,
        ),
        textAlign: TextAlign.center,
      ),
    ).animate().fadeIn().scale();
  }
}
