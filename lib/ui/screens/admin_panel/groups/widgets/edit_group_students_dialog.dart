import 'package:crm_flutter/core/utils/utils.dart';
import 'package:crm_flutter/data/models/groups/group.dart';
import 'package:flutter/material.dart';

import '../../../../../data/models/user/user.dart';

class EditGroupStudentsDialog extends StatelessWidget {
  final Group group;

  const EditGroupStudentsDialog({super.key, required this.group});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Edit group students'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text('Students'),
          if (group.students.isNotEmpty)
            ...List.generate(
              group.students.length,
              (index) {
                final User student = group.students[index];
                return ListTile(
                  title: Text(student.name),
                  trailing: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.delete),
                  ),
                  subtitle: Text("Id: ${student.id}"),
                );
              },
            )
          else
            const Center(child: Text('no students in this group'))
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text(
            'Cancel',
            style: TextStyle(color: AppColors.black),
          ),
        ),
        TextButton(
          onPressed: () {},
          child: const Text(
            'Save',
            style: TextStyle(color: AppColors.black),
          ),
        ),
        TextButton(
          onPressed: () {},
          child: const Text(
            'Add student',
            style: TextStyle(color: AppColors.black),
          ),
        ),
      ],
    );
  }
}
