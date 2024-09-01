import 'package:deez_notes/model/note_model.dart';
import 'package:deez_notes/presentation/components/app_bar.dart';
import 'package:deez_notes/presentation/components/button.dart';
import 'package:deez_notes/util/common/constants.dart';
import 'package:deez_notes/util/common/extension/build_context.dart';
import 'package:deez_notes/util/common/extension/widget_extensions.dart';
import 'package:deez_notes/util/common/strings.dart';
import 'package:deez_notes/util/theme/colors.dart';
import 'package:deez_notes/util/theme/spacing.dart';
import 'package:deez_notes/util/theme/typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:gap/gap.dart';

import 'bloc/home_bloc.dart';
import 'bloc/multiple_delete/multiple_delete_bloc.dart';
import 'widgets/note_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NoteAppBar(
        systemUiOverlayStyle: SystemUiOverlayStyle.light,
        autoImplementLeading: false,
        title: StringConstants.homeAppBarTitle,
        actions: context.watch<MultipleDeleteBloc>().state.mapOrNull(
              selected: (selectedNotes) => [
                AppButton(
                  child: Row(
                    children: [
                      Text(
                        'Delete - ${selectedNotes.selectedIds.length}',
                        style: AppTypography.headline6.copyWith(color: AppColors.white),
                      ),
                      const Gap(AppSpacings.xl),
                       AppIcons.icTrash.svgPicture(),
                    ],
                  ),
                  onPressed: () {
                    context.read<MultipleDeleteBloc>().add(const MultipleDeleteEvent.delete());
                  },
                ),
                AppButton(
                  child: AppIcons.icCancel.svgPicture(),
                  onPressed: () {
                    context.read<MultipleDeleteBloc>().add(const MultipleDeleteEvent.clearAll());
                  },
                ),
              ].animate().fadeIn(),
            ),
      ),

      //* add new note button
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        tooltip: 'Add note',
        onPressed: () {
          // context.router.push(AddUpdateNoteRoute());
        },
        child: AppIcons.icPlus.svgPicture(),
      ).animate(delay: animationDuration).fadeIn().slideX(begin: 1),

      //* Show available notes list
      body: ValueListenableBuilder(
        valueListenable: getIt<Database>().box.listenable(),
        builder: (context, _, child) {
          context.read<HomeBloc>().add(const HomeEvent.getAllNotes());
          return child!;
        },
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (_, state) {
            return state.maybeMap(
              orElse: () => const ErrorText('Loading..'),
              error: (error) => ErrorText(error.message ?? ''),
              loaded: (data) => _BuildNotesList(notes: data.notes),
            );
          },
        ),
      ),
    );
  }
}

class _BuildNotesList extends StatelessWidget {
  const _BuildNotesList({required this.notes});

  final List<Note> notes;

  @override
  Widget build(BuildContext context) {
    // final multipleDeleteBloc = context.read<MultipleDeleteBloc>();

    return MasonryGridView.count(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacings.xl,
        vertical: AppSpacings.xl,
      ),
      crossAxisCount: _getCrossAxisCount(context),
      itemCount: notes.length,
      itemBuilder: (BuildContext context, int index) {
        final noteId = notes[index].id!;
        return NoteCard(
          note: notes[index],
          selected: false,
          onTap: () {
            // multipleDeleteBloc.state.maybeMap(
            //   orElse: () {
            //     context.router.push(NoteDetailRoute(noteId: noteId));
            //   },
            //   selected: (_) {
            //     multipleDeleteBloc.add(MultipleDeleteEvent.toggleSelect(noteId));
            //   },
            // );
          },
          onSelect: () {
            // multipleDeleteBloc.add(MultipleDeleteEvent.toggleSelect(noteId));
          },
        ).animate().fadeIn(delay: 100.ms * index).moveX(delay: 100.ms * index);
      },
      mainAxisSpacing: AppSpacings.l,
      crossAxisSpacing: AppSpacings.l,
    );
  }

  int _getCrossAxisCount(BuildContext context) {
    if (context.isDesktop) {
      return 4;
    } else if (context.isTablet) {
      return 3;
    }
    return 2;
  }
}
