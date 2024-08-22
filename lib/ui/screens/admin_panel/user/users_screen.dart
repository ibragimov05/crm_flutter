import 'package:crm_flutter/app_config.dart';
import 'package:crm_flutter/core/utils/app_colors.dart';
import 'package:crm_flutter/core/utils/app_functions.dart';
import 'package:crm_flutter/ui/screens/admin_panel/user/widgets/display_users_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../logic/bloc/admin_management/admin_management_bloc.dart';

class UsersScreen extends StatelessWidget {
  const UsersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt.get<AdminManagementBloc>(),
      child: const _UsersScreen(),
    );
  }
}

class _UsersScreen extends StatefulWidget {
  const _UsersScreen();

  @override
  State<_UsersScreen> createState() => _UsersScreenState();
}

class _UsersScreenState extends State<_UsersScreen> {
  @override
  void initState() {
    super.initState();
    context
        .read<AdminManagementBloc>()
        .add(const AdminManagementEvent.getAllUsers());
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Users'),
          bottom: TabBar(
            dividerColor: AppColors.grayishBlue.withOpacity(0.1),
            indicatorColor: AppColors.blue,
            labelColor: Colors.blue,
            tabs: const [
              Tab(text: 'All users'),
              Tab(text: 'Students'),
              Tab(text: 'Teachers'),
              Tab(text: 'Admins'),
            ],
          ),
        ),
        body: BlocBuilder<AdminManagementBloc, AdminManagementState>(
          builder: (context, state) {
            if (state.adminManagementStatus == AdminManagementStatus.loading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state.adminManagementStatus ==
                AdminManagementStatus.error) {
              return Center(child: Text(state.error ?? 'unknown error'));
            } else if (state.adminManagementStatus ==
                AdminManagementStatus.loaded) {
              return TabBarView(
                children: [
                  DisplayUsersWidget(users: state.users ?? []),
                  DisplayUsersWidget(
                    users: AppFunction.getUserFromRoleId(
                      roleId: 1,
                      users: state.users ?? [],
                    ),
                  ),
                  DisplayUsersWidget(
                    users: AppFunction.getUserFromRoleId(
                      roleId: 2,
                      users: state.users ?? [],
                    ),
                  ),
                  DisplayUsersWidget(
                    users: AppFunction.getUserFromRoleId(
                      roleId: 3,
                      users: state.users ?? [],
                    ),
                  ),
                ],
              );
            }

            return const SizedBox();
          },
        ),
      ),
    );
  }
}
