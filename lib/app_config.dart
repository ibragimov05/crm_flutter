import 'package:crm_flutter/data/repositories/auth_repository.dart';
import 'package:crm_flutter/data/repositories/user_repository.dart';
import 'package:crm_flutter/data/services/dio/auth_dio_service.dart';
import 'package:crm_flutter/data/services/dio/user_dio_service.dart';
import 'package:crm_flutter/logic/bloc/auth/auth_bloc.dart';
import 'package:crm_flutter/logic/bloc/user/user_bloc.dart';
import 'package:crm_flutter/logic/cubit/edit_profile_form_cubit/edit_profile_form_cubit.dart';
import 'package:crm_flutter/logic/cubit/register_form_cubit/register_form_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'logic/cubit/login_form_cubit/login_form_cubit.dart';

final GetIt getIt = GetIt.instance;
late SharedPreferences sharedPrefs;

class AppConfig {
  static Future<void> setUp() async {
    sharedPrefs = await SharedPreferences.getInstance();

    // Bloc.observer = const CrmFlutterBlocObserver();
  }

  static void dependencySetup() {
    /// registering repositories
    getIt.registerLazySingleton(
      () => AuthRepository(authDioService: AuthDioService()),
    );
    getIt.registerLazySingleton(
      () => UserRepository(userDioService: UserDioService()),
    );

    /// registering blocs && cubits
    /// [BLOCS]
    getIt.registerLazySingleton(
      () => AuthBloc(
          authRepository: getIt.get<AuthRepository>(),
          userRepository: getIt.get<UserRepository>()),
    );
    getIt.registerLazySingleton(
      () => UserBloc(userRepository: getIt.get<UserRepository>()),
    );

    /// [CUBITS]
    getIt.registerLazySingleton(() => LoginFormCubit());
    getIt.registerLazySingleton(() => RegisterFormCubit());
    getIt.registerLazySingleton(() => EditProfileFormCubit());
  }
}
