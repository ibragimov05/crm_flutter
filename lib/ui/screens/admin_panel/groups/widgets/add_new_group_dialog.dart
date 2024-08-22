import 'package:crm_flutter/core/utils/utils.dart';
import 'package:crm_flutter/data/models/groups/add_group_request.dart';
import 'package:crm_flutter/data/models/user/user.dart';
import 'package:crm_flutter/ui/widgets/app_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../logic/bloc/admin_group_management/admin_group_management_bloc.dart';
import '../../../../../logic/bloc/admin_management/admin_management_bloc.dart';

class AddNewGroupDialog extends StatefulWidget {
  const AddNewGroupDialog({super.key});

  @override
  State<AddNewGroupDialog> createState() => _AddNewGroupDialogState();
}

class _AddNewGroupDialogState extends State<AddNewGroupDialog> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _groupNameController = TextEditingController();

  User? _selectedMainTeacher;
  User? _selectedAssistantTeacher;

  @override
  void dispose() {
    _groupNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Add New Group'),
      content: BlocBuilder<AdminManagementBloc, AdminManagementState>(
        builder: (context, state) {
          if (state.adminManagementStatus == AdminManagementStatus.loaded &&
              state.users != null &&
              state.users!.isNotEmpty) {
            final List<User> teachers = AppFunction.getUserFromRoleId(
                roleId: 2, users: state.users ?? []);

            if (_selectedMainTeacher == null) {
              _selectedMainTeacher = teachers.first;
              _selectedAssistantTeacher = teachers.first;
            }

            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Form(
                  key: _formKey,
                  child: AppTextFormField(
                    labelText: 'Group Name',
                    textInputAction: TextInputAction.next,
                    controller: _groupNameController,
                    validator: (value) =>
                        value!.isEmpty ? 'Please enter a group name' : null,
                  ),
                ),
                const SizedBox(height: 16),
                _buildPopupMenuButton(
                  label: 'Choose a Teacher',
                  selectedTeacher: _selectedMainTeacher,
                  users: teachers,
                  onSelected: (value) =>
                      setState(() => _selectedMainTeacher = value),
                ),
                const SizedBox(height: 16),
                _buildPopupMenuButton(
                  label: 'Choose an Assistant Teacher',
                  selectedTeacher: _selectedAssistantTeacher,
                  users: teachers,
                  onSelected: (value) =>
                      setState(() => _selectedAssistantTeacher = value),
                ),
              ],
            );
          }
          return const Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Center(
                child: CircularProgressIndicator(color: Colors.black),
              ),
            ],
          );
        },
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              final AddGroupRequest addGroupRequest = AddGroupRequest(
                name: _groupNameController.text,
                mainTeacherId: _selectedMainTeacher?.id ?? -1,
                assistantTeacherId: _selectedAssistantTeacher?.id ?? -1,
              );

              context.read<AdminGroupManagementBloc>().add(
                    AddGroupAdminManEvent(newGroup: addGroupRequest),
                  );
              Navigator.of(context).pop();
            }
          },
          child: const Text('Add'),
        ),
      ],
    );
  }

  Widget _buildPopupMenuButton({
    required String label,
    required User? selectedTeacher,
    required List<User> users,
    required ValueChanged<User> onSelected,
  }) =>
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PopupMenuButton<User>(
            onSelected: onSelected,
            itemBuilder: (context) {
              return users.map((User user) {
                return PopupMenuItem<User>(
                  value: user,
                  child: Text("ID ${user.id}. ${user.name}"),
                );
              }).toList();
            },
            child: ListTile(
              title: Text(
                selectedTeacher != null
                    ? "ID ${selectedTeacher.id}. ${selectedTeacher.name}"
                    : label,
              ),
              trailing: const Icon(Icons.arrow_drop_down),
            ),
          ),
          const SizedBox(height: 8),
        ],
      );
}
