// Copyright (c) 2021, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:leading/app/app_locator.dart';
import 'package:leading/app/app_router.dart';
import 'package:leading/l10n/l10n.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final routerDelegate = BeamerRouterDelegate(
      locationBuilder: SimpleLocationBuilder(
        routes: locator<AppRouter>().routes,
      ),
    );

    return MaterialApp.router(
      key: locator<AppRouter>().navigatorKey,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        accentColor: const Color(0xFF13B9FF),
        appBarTheme: const AppBarTheme(color: Color(0xFF13B9FF)),
      ),
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      routeInformationParser: BeamerRouteInformationParser(),
      backButtonDispatcher: BeamerBackButtonDispatcher(
        delegate: routerDelegate,
      ),
      routerDelegate: routerDelegate,
    );
  }
}
