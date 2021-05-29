import 'dart:async';
import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:bloc/bloc.dart';
import 'package:leading/app/app.dart';
import 'package:leading/app/app_bloc_observer.dart';
import 'package:leading/app/app_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  setup();

  Bloc.observer = AppBlocObserver();
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  await Firebase.initializeApp();

  runZonedGuarded(() => runApp(const App()), (error, stackTrace) {
    log(error.toString(), stackTrace: stackTrace);
  });
}
