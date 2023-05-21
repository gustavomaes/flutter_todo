import 'package:flutter/material.dart';
import 'package:todo_list/widgets/button.dart';

class AddTask extends StatelessWidget {
  final TextEditingController controller;
  VoidCallback onSave;
  VoidCallback onCancel;

  AddTask({
    super.key,
    required this.controller,
    required this.onSave,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Add a new task!'),
      content: SizedBox(
        width: double.maxFinite,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: controller,
              decoration: const InputDecoration(
                  contentPadding: EdgeInsets.all(16),
                  isDense: true,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: Colors.purple),
                  ),
                  hintText: 'Type here...'),
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Button(
                  label: 'Add',
                  onPress: onSave,
                ),
                const SizedBox(width: 8),
                Button(
                  label: 'Cancel',
                  onPress: onCancel,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
