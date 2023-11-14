import 'package:skyfeed/app.dart';

class CreateListDialog extends StatefulWidget {
  final CreateListState? initialState;
  const CreateListDialog({this.initialState, super.key});

  @override
  State<CreateListDialog> createState() => _CreateListDialogState();
}

class _CreateListDialogState extends State<CreateListDialog> {
  final nameCtrl = TextEditingController();
  final descriptionCtrl = TextEditingController();

  late final CreateListState state;
  @override
  void initState() {
    state = widget.initialState ?? CreateListState();
    nameCtrl.text = state.name;
    descriptionCtrl.text = state.description;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        widget.initialState == null ? 'Create new List' : 'Edit List',
      ),
      content: SizedBox(
        width: context.dialogWidth,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(
                labelText: 'Purpose',
              ),
              value: state.purpose,
              items: const [
                DropdownMenuItem(
                  value: 'app.bsky.graph.defs#curatelist',
                  child: Text('Curation'),
                ),
                DropdownMenuItem(
                  value: 'app.bsky.graph.defs#modlist',
                  child: Text('Moderation (Mute/Block)'),
                ),
              ],
              onChanged: (val) {
                setState(() {
                  state.purpose = val!;
                });
              },
            ),
            SizedBox(height: context.formFieldPadding),
            TextField(
              decoration: const InputDecoration(
                labelText: 'Name',
              ),
              autofocus: true,
              controller: nameCtrl,
              onChanged: (s) => state.name = s,
            ),
            SizedBox(height: context.formFieldPadding),
            TextField(
              maxLines: 3,
              decoration: const InputDecoration(
                labelText: 'Description',
              ),
              controller: descriptionCtrl,
              onChanged: (s) => state.description = s,
            )
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => context.pop(),
          child: const Text('Cancel'),
        ),
        FilledButton(
          onPressed: () => context.pop(state),
          child: const Text('Create'),
        ),
      ],
    );
  }
}

class CreateListState {
  String purpose = 'app.bsky.graph.defs#curatelist';
  String name = '';
  String description = '';
}
