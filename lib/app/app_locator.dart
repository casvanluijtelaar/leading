import 'package:get_it/get_it.dart';
import 'package:leading/app/app_router.dart';
import 'package:leading/app/app_theme.dart';
import 'package:leading/features/details/details.dart';
import 'package:leading/features/location_end/location_end.dart';
import 'package:leading/features/location_start/location_start.dart';
import 'package:leading/features/onboarding/onboarding.dart';
import 'package:leading/features/permissions/permissions.dart';
import 'package:leading/features/setup/bloc/setup_bloc.dart';
import 'package:leading/features/tracker/tracker.dart';
import 'package:uuid/uuid.dart';

import 'data/src/bluetooth.dart';
import 'data/src/database.dart';

GetIt locator = GetIt.instance;

void setup() {
  /// core
  locator
    ..registerLazySingleton(() => AppRouter())
    ..registerLazySingleton(() => AppTheme())
    ..registerLazySingleton(() => Bluetooth())
    ..registerLazySingleton(() => Database())
    ..registerLazySingleton(() => const Uuid())

    /// setup
    ..registerFactory(() => SetupBloc(locator()))

    /// permissions
    ..registerLazySingleton(() => PermissionsRepository())
    ..registerFactory(() => PermissionsBloc(locator()))

    /// location_start
    ..registerLazySingleton(() => LocationStartRepository(locator(), locator()))
    ..registerFactory(() => LocationStartBloc(locator()))

    /// location_end
    ..registerLazySingleton(() => LocationEndRepository(locator()))
    ..registerFactory(() => LocationEndBloc(locator(), locator()))

    /// details
    ..registerLazySingleton(() => DetailsRepository(locator(), locator()))
    ..registerFactory(() => DetailsBloc(locator()))

    /// onboarding
    ..registerFactory(() => OnboardingBloc(locator()))

    /// tracker
    ..registerLazySingleton(() => TrackerRepository(locator(), locator()))
    ..registerFactory(() => TrackerBloc(locator(), locator()));
}
