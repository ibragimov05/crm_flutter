import 'package:crm_flutter/core/utils/user_constants.dart';
import 'package:crm_flutter/logic/bloc/auth/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'widgets/profile_screen_private_widgets.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          if (UserData.roleId == 3 && UserData.roleName == 'admin')
            const _AdminPopupMenuButton(),
          const _LogoutButton(),
        ],
      ),
    );
  }
}
