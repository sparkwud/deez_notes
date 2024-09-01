import 'package:auto_size_text/auto_size_text.dart';
import 'package:deez_notes/model/note_model.dart';
import 'package:deez_notes/util/common/extension/widget_extensions.dart';
import 'package:deez_notes/util/common/strings.dart';
import 'package:deez_notes/util/theme/colors.dart';
import 'package:deez_notes/util/theme/spacing.dart';
import 'package:deez_notes/util/theme/typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:gap/gap.dart';

class NoteCard extends StatelessWidget {
  const NoteCard({
    super.key,
    required this.note,
    this.selected = false,
    this.onSelect,
    this.onTap,
  });

  final Note note;
  final bool selected;
  final Function()? onSelect;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      clipBehavior: Clip.antiAlias,
      borderRadius: BorderRadius.circular(AppSpacings.m),
      color: note.color,
      child: InkWell(
        splashColor: Colors.black12,
        onLongPress: onSelect,
        onTap: onTap,
        child: Container(
          constraints: const BoxConstraints(
            maxHeight: 300,
            minHeight: 100,
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacings.l,
            vertical: AppSpacings.l,
          ),
          child: Stack(
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: AutoSizeText(
                      note.title ?? '',
                      presetFontSizes: const [16, 14, 12, 10, 8],
                      textScaleFactor: 2,
                      softWrap: true,
                      style: AppTypography.headline6,
                      group: AutoSizeGroup(),
                      overflow: TextOverflow.fade,
                    ),
                  ),
                  const Gap(AppSpacings.m),
                  Text(
                    note.date,
                    style: AppTypography.description
                        .copyWith(color: Colors.black87),
                  ),
                ],
              ),
              if (selected)
                Align(
                  alignment: Alignment.topRight,
                  heightFactor: 2,
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 10,
                          spreadRadius: 20,
                          color: note.color ?? AppColors.primary,
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: AppIcons.icCheck.svgPicture(
                        height: 20,
                        color: note.color,
                      ),
                    ),
                  ).animate().fadeIn(duration: 100.ms),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
