// Copyright (c) 2021, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:leading/app/app_locator.dart';
import 'package:leading/app/app_router.dart';
import 'package:leading/generated/l10n.dart';

import 'package:flutter_localizations/flutter_localizations.dart';

import 'app_theme.dart';

class App extends StatelessWidget {
  App({Key? key}) : super(key: key);

  final routerDelegate = BeamerRouterDelegate(
    locationBuilder: SimpleLocationBuilder(
      routes: locator<AppRouter>().routes,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return BeamerProvider(
      routerDelegate: routerDelegate,
      child: MaterialApp.router(
        localizationsDelegates: [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        key: locator<AppRouter>().navigatorKey,
        debugShowCheckedModeBanner: false,
        theme: locator<AppTheme>().getTheme(context),
        routeInformationParser: BeamerRouteInformationParser(),
        backButtonDispatcher: BeamerBackButtonDispatcher(
          delegate: routerDelegate,
        ),
        routerDelegate: routerDelegate,
      ),
    );
  }
}
