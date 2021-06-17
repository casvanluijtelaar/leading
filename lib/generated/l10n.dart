// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Continue`
  String get buttonContinue {
    return Intl.message(
      'Continue',
      name: 'buttonContinue',
      desc: '',
      args: [],
    );
  }

  /// `Retry`
  String get buttonRetry {
    return Intl.message(
      'Retry',
      name: 'buttonRetry',
      desc: '',
      args: [],
    );
  }

  /// `Welcome`
  String get permissionsTitle {
    return Intl.message(
      'Welcome',
      name: 'permissionsTitle',
      desc: '',
      args: [],
    );
  }

  /// `Leading requires Bluetooth and Location permissions. Make sure both are enabled to continue`
  String get permissionsSubtitle {
    return Intl.message(
      'Leading requires Bluetooth and Location permissions. Make sure both are enabled to continue',
      name: 'permissionsSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Location`
  String get locationStartTitle {
    return Intl.message(
      'Location',
      name: 'locationStartTitle',
      desc: '',
      args: [],
    );
  }

  /// `We couldn’t establish your current location. Are you in the right place?`
  String get locationStartError {
    return Intl.message(
      'We couldn’t establish your current location. Are you in the right place?',
      name: 'locationStartError',
      desc: '',
      args: [],
    );
  }

  /// `Looking for your location`
  String get locationStartLoading {
    return Intl.message(
      'Looking for your location',
      name: 'locationStartLoading',
      desc: '',
      args: [],
    );
  }

  /// `I see that you’re currently at {name} let’s see where you want to go`
  String locationStartSucces(Object name) {
    return Intl.message(
      'I see that you’re currently at $name let’s see where you want to go',
      name: 'locationStartSucces',
      desc: '',
      args: [name],
    );
  }

  /// `Destination`
  String get locationEndTitle {
    return Intl.message(
      'Destination',
      name: 'locationEndTitle',
      desc: '',
      args: [],
    );
  }

  /// `We couldn’t find any suitable destinations, check your internet connectivity`
  String get locationEndError {
    return Intl.message(
      'We couldn’t find any suitable destinations, check your internet connectivity',
      name: 'locationEndError',
      desc: '',
      args: [],
    );
  }

  /// `Where is It you'd like to go?`
  String get locationEndSucces {
    return Intl.message(
      'Where is It you\'d like to go?',
      name: 'locationEndSucces',
      desc: '',
      args: [],
    );
  }

  /// `Finishing up`
  String get detailsTitle {
    return Intl.message(
      'Finishing up',
      name: 'detailsTitle',
      desc: '',
      args: [],
    );
  }

  /// `We've calculated the best route and finished up some background tasks`
  String get detailsSucces {
    return Intl.message(
      'We\'ve calculated the best route and finished up some background tasks',
      name: 'detailsSucces',
      desc: '',
      args: [],
    );
  }

  /// `Calculating best route`
  String get detailsLoading {
    return Intl.message(
      'Calculating best route',
      name: 'detailsLoading',
      desc: '',
      args: [],
    );
  }

  /// `Back`
  String get onboardingBack {
    return Intl.message(
      'Back',
      name: 'onboardingBack',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get onboardingCancel {
    return Intl.message(
      'Cancel',
      name: 'onboardingCancel',
      desc: '',
      args: [],
    );
  }

  /// `Start`
  String get onboardingStart {
    return Intl.message(
      'Start',
      name: 'onboardingStart',
      desc: '',
      args: [],
    );
  }

  /// `Next`
  String get onboardingNext {
    return Intl.message(
      'Next',
      name: 'onboardingNext',
      desc: '',
      args: [],
    );
  }

  /// `Colour`
  String get onboardingColorTitle {
    return Intl.message(
      'Colour',
      name: 'onboardingColorTitle',
      desc: '',
      args: [],
    );
  }

  /// `This is your colour. It will guide you through your wayfinding journey`
  String get onboardingColorSubtitle {
    return Intl.message(
      'This is your colour. It will guide you through your wayfinding journey',
      name: 'onboardingColorSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Animation`
  String get onboardingAnimationTitle {
    return Intl.message(
      'Animation',
      name: 'onboardingAnimationTitle',
      desc: '',
      args: [],
    );
  }

  /// `Your wayfinding route will be displayed by LED animations in your colour, they will guide you to your destination.`
  String get onboardingAnimationSubtitle {
    return Intl.message(
      'Your wayfinding route will be displayed by LED animations in your colour, they will guide you to your destination.',
      name: 'onboardingAnimationSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Summery`
  String get onboardingSummeryTitle {
    return Intl.message(
      'Summery',
      name: 'onboardingSummeryTitle',
      desc: '',
      args: [],
    );
  }

  /// `from`
  String get onboardingSummeryStart {
    return Intl.message(
      'from',
      name: 'onboardingSummeryStart',
      desc: '',
      args: [],
    );
  }

  /// `to`
  String get onboardingSummeryEnd {
    return Intl.message(
      'to',
      name: 'onboardingSummeryEnd',
      desc: '',
      args: [],
    );
  }

  /// `Wayfinding in Progress`
  String get trackerProgressTitle {
    return Intl.message(
      'Wayfinding in Progress',
      name: 'trackerProgressTitle',
      desc: '',
      args: [],
    );
  }

  /// `Follow your colour to your destination, we’ll Let you know once you get there! You can always quit if you want to.`
  String get trackerProgressSubtitle {
    return Intl.message(
      'Follow your colour to your destination, we’ll Let you know once you get there! You can always quit if you want to.',
      name: 'trackerProgressSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `To {location}`
  String trackerProgressEnd(Object location) {
    return Intl.message(
      'To $location',
      name: 'trackerProgressEnd',
      desc: '',
      args: [location],
    );
  }

  /// `Quit`
  String get trackerProgressQuit {
    return Intl.message(
      'Quit',
      name: 'trackerProgressQuit',
      desc: '',
      args: [],
    );
  }

  /// `We're here`
  String get trackerCompleteTitle {
    return Intl.message(
      'We\'re here',
      name: 'trackerCompleteTitle',
      desc: '',
      args: [],
    );
  }

  /// `You’ve reached your destination. your route will no longer be marked. Click Complete to start over!`
  String get trackerCompleteSubtitle {
    return Intl.message(
      'You’ve reached your destination. your route will no longer be marked. Click Complete to start over!',
      name: 'trackerCompleteSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Currently at {location}`
  String trackerCompleteEnd(Object location) {
    return Intl.message(
      'Currently at $location',
      name: 'trackerCompleteEnd',
      desc: '',
      args: [location],
    );
  }

  /// `Complete`
  String get trackerCompleteQuit {
    return Intl.message(
      'Complete',
      name: 'trackerCompleteQuit',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'nl'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
