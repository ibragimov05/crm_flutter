import 'package:crm_flutter/app_config.dart';
import 'package:crm_flutter/core/utils/app_colors.dart';
import 'package:crm_flutter/logic/bloc/admin_group_management/admin_group_management_bloc.dart';
import 'package:crm_flutter/ui/screens/admin_panel/groups/widgets/group_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GroupsScreen extends StatelessWidget {
  const GroupsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt.get<AdminGroupManagementBloc>(),
      child: const _GroupScreen(),
    );
  }
}

class _GroupScreen extends StatefulWidget {
  const _GroupScreen();

  @override
  State<_GroupScreen> createState() => _GroupScreenState();
}

class _GroupScreenState extends State<_GroupScreen> {
  @override
  void initState() {
    super.initState();
    context
        .read<AdminGroupManagementBloc>()
        .add(const GetAllGroupsAdminManEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Group management')),
      body: BlocBuilder<AdminGroupManagementBloc, AdminGroupManagementState>(
        builder: (context, state) {
          if (state is LoadingAdminGroupManagementState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ErrorAdminGroupManagementState) {
            return Center(child: Text(state.errorMessage));
          } else if (state is LoadedAdminGroupManagementState) {
            return ListView.builder(
              itemCount: state.allGroups.length,
              padding: const EdgeInsets.only(bottom: kToolbarHeight + 20),
              itemBuilder: (context, index) =>
                  GroupItem(group: state.allGroups[index]),
            );
          }
          return const SizedBox();
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.grayishBlue,
        onPressed: () {},
        tooltip: 'Add new group',
        child: const Icon(Icons.add),
      ),
    );
  }
}
