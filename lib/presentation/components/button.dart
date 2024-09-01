import 'package:deez_notes/util/common/constants.dart';
import 'package:deez_notes/util/theme/colors.dart';
import 'package:deez_notes/util/theme/spacing.dart';
import 'package:deez_notes/util/theme/typography.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.child,
    required this.onPressed,
    this.isLoading = false,
  });

  final Widget? child;
  final VoidCallback? onPressed;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: AppTypography.buttonLink.copyWith(color: AppColors.white),
      child: GestureDetector(
        onTap: onPressed,
        child: AnimatedSwitcher(
          duration: animationDuration,
          transitionBuilder: (child, animation) => ScaleTransition(
            scale: animation,
            child: child,
          ),
          child: Container(
            padding: const EdgeInsets.all(AppSpacings.m),
            height: 40,
            constraints: const BoxConstraints(minWidth: 40),
            decoration: BoxDecoration(
              color: const Color(0xff444444),
              borderRadius: BorderRadius.circular(AppSpacings.l),
            ),
            child: Center(
              key: ValueKey(isLoading),
              child: isLoading ? const Text(' Saving.. ') : child,
            ),
          ),
        ),
      ),
    );
  }
}
