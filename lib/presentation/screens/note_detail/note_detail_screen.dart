import 'package:deez_notes/model/note_model.dart';
import 'package:deez_notes/model/todo_model.dart';
import 'package:deez_notes/presentation/components/button.dart';
import 'package:deez_notes/presentation/components/components.dart';
import 'package:deez_notes/util/common/constants.dart';
import 'package:deez_notes/util/common/extension/random.dart';
import 'package:deez_notes/util/common/extension/widget_extensions.dart';
import 'package:deez_notes/util/common/strings.dart';
import 'package:deez_notes/util/theme/spacing.dart';
import 'package:deez_notes/util/theme/typography.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'bloc/action/note_action_bloc.dart';
import 'bloc/detail/note_detail_bloc.dart';

class NoteDetailScreen extends StatefulWidget {
  const NoteDetailScreen({super.key, required this.noteId});

  final String noteId;

  @override
  State<NoteDetailScreen> createState() => _NoteDetailScreenState();
}

class _NoteDetailScreenState extends State<NoteDetailScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: state.whenOrNull(
        success: (note) => note.color ?? colors.randomElement,
      ),
      appBar: NoteAppBar(
        actions: state.whenOrNull(
          success: (note) => [
            AppButton(
              child: AppIcons.icEdit.svgPicture(),
              onPressed: () {
                context.router.push(AddUpdateNoteRoute(note: note));
              },
            ),
            AppButton(
              child: AppIcons.icTrash.svgPicture(),
              onPressed: () {
                context
                    .read<NoteActionBloc>()
                    .add(NoteActionEvent.deleteNote(note.id!));
              },
            ),
          ],
        ),
      ),
      body: state.maybeMap(
        error: (error) => ErrorText(error.message ?? ''),
        success: (data) => _LoadedView(note: data.note),
        orElse: () => const SizedBox.shrink(),
      ),
    );
  }
}

class _LoadedView extends StatelessWidget {
  const _LoadedView({required this.note});

  final Note note;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacings.xl,
        vertical: AppSpacings.xl,
      ),
      children: [
        //* Show Note Title
        SelectableText(
          note.title ?? '',
          style: AppTypography.headline3,
        ),
        const Gap(AppSpacings.l),

        //* Show Note Update/Add time
        SelectableText(
          note.dateWithTime,
          style: AppTypography.description.copyWith(color: Colors.black87),
        ),
        const Gap(AppSpacings.xxl),

        //* Show todo's list if any
        if (note.hasTodo) ...{
          _BuildTodoList(todoList: note.todos),
          const Gap(AppSpacings.xxl),
        },

        //* Note Description
        SelectableText(
          note.description ?? '',
          style: AppTypography.headline6,
        ),
      ],
    );
  }
}

class _BuildTodoList extends StatelessWidget {
  const _BuildTodoList({required this.todoList});
  final List<Todo> todoList;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "TODO's",
          style: AppTypography.headline6
              .copyWith(decoration: TextDecoration.underline),
        ),
        ListView.builder(
          key: const PageStorageKey('note-todos'),
          shrinkWrap: true,
          itemCount: todoList.length,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (_, index) {
            final Todo todo = todoList[index];

            return CheckboxListTile(
              controlAffinity: ListTileControlAffinity.leading,
              dense: true,
              value: todo.completed,
              contentPadding: EdgeInsets.zero,
              title: Text(
                todo.title ?? '',
                style: AppTypography.title.copyWith(
                  decoration:
                      todo.completed ? TextDecoration.lineThrough : null,
                ),
              ),
              onChanged: (bool? value) {
                // context
                //     .read<NoteDetailBloc>()
                //     .add(NoteDetailEvent.toggleTodoCheckbox(todo.id!));
              },
            );
          },
        ),
      ],
    );
  }
}
