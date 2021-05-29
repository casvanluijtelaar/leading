import 'package:beamer/beamer.dart';
import 'package:flutter/widgets.dart';

import 'package:leading/features/onboarding/onboarding.dart';
import 'package:leading/features/setup/view/setup_page.dart';
import 'package:leading/features/tracker/tracker.dart';

class AppRouter {

  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  BuildContext get _context => navigatorKey.currentContext!;

  static const String setup = '/';
  static const String onboarding = '/onboarding';
  static const String tracker = '/tracker';

  final Map<String, Widget Function(BuildContext)> routes = {
    setup: (_) => const SetupPage(),
    onboarding: (_) => const OnboardingPage(),
    tracker: (_) => const TrackerPage(),
  };



  void navigateToRoute(
    String route, {
    Map<String, dynamic> data = const {},
    String popToNamed = onboarding,
  }) =>
      Beamer.of(_context).beamToNamed(
        route,
        beamBackOnPop: false,
        data: data,
        popToNamed: popToNamed,
        stacked: false,
      );

  void navigateBack() => _context.beamBack();
}
