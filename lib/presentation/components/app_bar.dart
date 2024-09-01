import 'package:deez_notes/util/common/constants.dart';
import 'package:deez_notes/util/common/extension/map_index.dart';
import 'package:deez_notes/util/common/extension/widget_extensions.dart';
import 'package:deez_notes/util/common/strings.dart';
import 'package:deez_notes/presentation/components/button.dart';
import 'package:deez_notes/util/theme/colors.dart';
import 'package:deez_notes/util/theme/spacing.dart';
import 'package:deez_notes/util/theme/typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';

class NoteAppBar extends StatelessWidget implements PreferredSizeWidget {
  const NoteAppBar({
    super.key,
    this.autoImplementLeading = true,
    this.title,
    this.actions,
    this.systemUiOverlayStyle = SystemUiOverlayStyle.dark,
  });

  final bool autoImplementLeading;
  final String? title;
  final List<Widget>? actions;
  final SystemUiOverlayStyle systemUiOverlayStyle;

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: systemUiOverlayStyle,
      child: Theme(
        data: Theme.of(context).copyWith(
          iconTheme: const IconThemeData(color: AppColors.white),
          brightness: Brightness.light,
        ),
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: AppSpacings.xl),
          padding: const EdgeInsets.symmetric(vertical: AppSpacings.xl),
          child: SafeArea(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (autoImplementLeading)
                  AppButton(
                    child: AppIcons.icLeft.svgPicture(),
                    onPressed: () {},
                    // onPressed: () => context.router.pop(),
                  ),
                (title != null)
                    ? Expanded(
                        child: Text(
                          title!,
                          style: AppTypography.headline1
                              .copyWith(color: AppColors.white),
                        ),
                      )
                    : const Spacer(),
                if (actions != null) ...{
                  ...actions!.mapIndexed(
                    (action, i) => Padding(
                      padding: (i == actions!.length - 1)
                          ? EdgeInsets.zero
                          : const EdgeInsets.only(right: AppSpacings.l),
                      child: action,
                    ),
                  ),
                },
              ],
            ),
          ),
        )
            .animate()
            .fadeIn(duration: animationDuration)
            .slideY(duration: animationDuration),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(100);
}
