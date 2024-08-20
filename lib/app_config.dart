import 'package:crm_flutter/data/repositories/auth_repository.dart';
import 'package:crm_flutter/data/services/dio/auth_dio_service.dart';
import 'package:crm_flutter/logic/bloc/auth/auth_bloc.dart';
import 'package:crm_flutter/logic/cubit/register_cubit/register_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import 'logic/cubit/login_cubit/login_cubit.dart';

final GetIt getIt = GetIt.instance;

class AppConfig {
  static Future<void> setUp() async {}

  static void dependencySetup() {
    /// registering repositories
    getIt.registerLazySingleton(
      () => AuthRepository(authDioService: AuthDioService()),
    );

    /// registering blocs && cubits
    /// [BLOCS]
    getIt.registerLazySingleton(
      () => AuthBloc(authRepository: getIt.get<AuthRepository>()),
    );

    /// [CUBITS]
    getIt.registerLazySingleton(
      () => LoginCubit(authRepository: getIt.get<AuthRepository>()),
    );
    getIt.registerLazySingleton(
      () => RegisterCubit(authRepository: getIt.get<AuthRepository>()),
    );
  }
}

List<BlocProvider> allBlocs = [
  BlocProvider.value(value: getIt.get<AuthBloc>()),
];
