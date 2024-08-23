import 'package:crm_flutter/logic/bloc/admin_management/admin_user_management_bloc.dart';
import 'package:crm_flutter/logic/bloc/auth/auth_bloc.dart';
import 'package:crm_flutter/logic/bloc/user/user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/app.dart';
import 'app_config.dart';
import 'logic/bloc/admin_group_management/admin_group_management_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await AppConfig.setUp();
  AppConfig.dependencySetup();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider.value(value: getIt.get<AuthBloc>()),
        BlocProvider.value(value: getIt.get<UserBloc>()),
        BlocProvider.value(value: getIt.get<  AdminGroupManagementBloc>()),
        BlocProvider.value(value: getIt.get<AdminUserManagementBloc>()),
      ],
      child: const App(),
    ),
  );
}
