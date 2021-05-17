import 'package:beamer/beamer.dart';
import 'package:flutter/widgets.dart';

import 'package:leading/features/landing/landing.dart';
import 'package:leading/features/location_end/location_end.dart';
import 'package:leading/features/location_start/location_start.dart';
import 'package:leading/features/onboarding/onboarding.dart';

class AppRouter {
  AppRouter();

  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  BuildContext get _context => navigatorKey.currentContext!;

  static const String home = '/';
  static const String start = '/start';
  static const String end = '/end';
  static const String onboarding = '/onboarding';

  final Map<String, Widget Function(BuildContext)> routes = {
    home: (_) => const LandingPage(),
    start: (_) => const LocationStartPage(),
    end: (_) => const LocationEndPage(),
    onboarding: (_) => const OnboardingPage(),
  };

  void navigateToRoute(String route) => Beamer.of(_context).beamToNamed(route);

  void navigateBack() => _context.beamBack();
}
