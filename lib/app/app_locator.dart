import 'package:get_it/get_it.dart';
import 'package:leading/app/app_router.dart';

import 'package:leading/features/landing/landing.dart';
import 'package:leading/features/location_start/location_start.dart';
import 'package:leading/features/location_end/location_end.dart';
import 'package:leading/features/onboarding/onboarding.dart';

import 'data/models/user.dart';
import 'data/src/bluetooth.dart';
import 'data/src/database.dart';

GetIt locator = GetIt.instance;

void setup() {
  /// core
  locator
    ..registerLazySingleton(() => AppRouter())
    ..registerLazySingleton(() => Bluetooth())
    ..registerLazySingleton(() => Database())
    ..registerLazySingleton(() => User())

    /// landing
    ..registerLazySingleton(() => LandingRepository(locator()))
    ..registerFactory(() => LandingBloc(locator(), locator()))

    /// location_start
    ..registerLazySingleton(() => LocationStartRepository(locator(), locator()))
    ..registerFactory(() => LocationStartBloc(locator(), locator(), locator()))

    /// location_end
    ..registerLazySingleton(() => LocationEndRepository(locator()))
    ..registerFactory(() => LocationEndBloc(locator(), locator(), locator()))

    /// onboarding
    ..registerLazySingleton(() => OnboardingRepository(locator()))
    ..registerFactory(() => OnboardingBloc(locator(), locator(), locator()));
}
