import 'package:deez_notes/model/note_model.dart';
import 'package:deez_notes/model/todo_model.dart';
import 'package:deez_notes/presentation/components/app_bar.dart';
import 'package:deez_notes/presentation/components/button.dart';
import 'package:deez_notes/util/common/constants.dart';
import 'package:deez_notes/util/common/extension/widget_extensions.dart';
import 'package:deez_notes/util/common/strings.dart';
import 'package:deez_notes/util/theme/colors.dart';
import 'package:deez_notes/util/theme/spacing.dart';
import 'package:deez_notes/util/theme/typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:gap/gap.dart';


part 'widgets/colors_bar.dart';
part 'widgets/text_forms.dart';
part 'widgets/todo_tile.dart';

class AddUpdateNoteScreen extends StatefulWidget {
  const AddUpdateNoteScreen({super.key, this.note});

  final Note? note;

  @override
  State<AddUpdateNoteScreen> createState() => _AddUpdateNoteScreenState();
}

class _AddUpdateNoteScreenState extends State<AddUpdateNoteScreen> {
  late TextEditingController _titleController;
  late TextEditingController _descriptionController;

  @override
  void initState() {
    super.initState();

    _titleController = TextEditingController(text: widget.note?.title);
    _descriptionController = TextEditingController(text: widget.note?.description);

  //   context.read<AddUpdateFormBloc>().add(
  //         AddUpdateFormEvent.initialize(
  //           title: widget.note?.title,
  //           description: widget.note?.description,
  //           color: widget.note?.color ?? colors.randomElement,
  //           todos: widget.note?.todos,
  //         ),
  //       );
  }

  @override
  Widget build(BuildContext context) {
    return 
    Stack(
          children: [
            _BuildForm(
              widget: widget,
              state: state,
              titleController: _titleController,
              descriptionController: _descriptionController,
            ),

            //* show overlay screen while saving.
            context
                .watch<AddUpdateBloc>()
                .state
                .maybeMap(
                  orElse: () => const Gap((),
                  saving: (_) => Container(
                    color: Colors.black.withOpacity(0.2),
                  ),
                )
                .animate()
                .fadeIn()
                .shimmer(),
          ],
        );
      },
    );
  }
}

class _BuildForm extends StatelessWidget {
  const _BuildForm({
    required this.widget,
    required TextEditingController titleController,
    required TextEditingController descriptionController,
    required this.state,
  })  : _titleController = titleController,
        _descriptionController = descriptionController;

  final AddUpdateNoteScreen widget;
  final TextEditingController _titleController;
  final TextEditingController _descriptionController;
  final AddUpdateFormState state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: state.selectedColor,
      bottomNavigationBar: ColorsBar(
        selectedColor: state.selectedColor,
        onChanged: (Color color) {
          // context.read<AddUpdateFormBloc>().add(AddUpdateFormEvent.colorChanged(color));
        },
      ),
      appBar: NoteAppBar(
        actions: [
          AppButton(
                    
            child: const Text('  Save  '),
            onPressed: () => _addOrUpdateNote(context),
          ),
        ],
      ),
      body: ListView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacings.xl,
          vertical: AppSpacings.xl,
        ),
        children: [
          //* Add/Update Note title
          _BuildTitleField(
            state: state,
            titleController: _titleController,
          ),
          const Gap(AppSpacings.xl),

          //* Add/Update todo list.
          _BuildTodoListField(state: state),
          const Gap(AppSpacings.xl),

          //* Add/Update note description.
          _BuildDescriptionField(
            state: state,
            descriptionController: _descriptionController,
          ),
        ],
      ),
    );
  }

  void _addOrUpdateNote(BuildContext context) {
    if (widget.note == null) {
      // context.read<AddUpdateBloc>().add(
      //       AddUpdateEvent.addNote(
      //         Note(
      //           title: _titleController.text,
      //           description: _descriptionController.text,
      //           color: state.selectedColor,
      //           dateTime: DateTime.now(),
      //           todos: state.todos,
      //         ),
      //       ),
      //     );
    } else {
      // context.read<AddUpdateBloc>().add(
      //       AddUpdateEvent.updateNote(
      //         Note(
      //           id: widget.note!.id!,
      //           title: _titleController.text,
      //           description: _descriptionController.text,
      //           color: state.selectedColor,
      //           dateTime: DateTime.now(),
      //           todos: state.todos,
      //         ),
      //         widget.note!.id!,
      //       ),
      //     );
    }
  }
}
