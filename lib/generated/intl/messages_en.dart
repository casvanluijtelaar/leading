// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  static String m0(name) =>
      "I see that you’re currently at ${name} let’s see where you want to go";

  static String m1(location) => "Currently at ${location}";

  static String m2(location) => "To ${location}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "buttonContinue": MessageLookupByLibrary.simpleMessage("Continue"),
        "buttonRetry": MessageLookupByLibrary.simpleMessage("Retry"),
        "detailsLoading":
            MessageLookupByLibrary.simpleMessage("Calculating best route"),
        "detailsSucces": MessageLookupByLibrary.simpleMessage(
            "We\'ve calculated the best route and finished up some background tasks"),
        "detailsTitle": MessageLookupByLibrary.simpleMessage("Finishing up"),
        "locationEndError": MessageLookupByLibrary.simpleMessage(
            "We couldn’t find any suitable destinations, check your internet connectivity"),
        "locationEndSucces": MessageLookupByLibrary.simpleMessage(
            "Where is It you\'d like to go?"),
        "locationEndTitle": MessageLookupByLibrary.simpleMessage("Destination"),
        "locationStartError": MessageLookupByLibrary.simpleMessage(
            "We couldn’t establish your current location. Are you in the right place?"),
        "locationStartLoading":
            MessageLookupByLibrary.simpleMessage("Looking for your location"),
        "locationStartSucces": m0,
        "locationStartTitle": MessageLookupByLibrary.simpleMessage("Location"),
        "onboardingAnimationSubtitle": MessageLookupByLibrary.simpleMessage(
            "Your wayfinding route will be displayed by LED animations in your colour, they will guide you to your destination."),
        "onboardingAnimationTitle":
            MessageLookupByLibrary.simpleMessage("Animation"),
        "onboardingBack": MessageLookupByLibrary.simpleMessage("Back"),
        "onboardingCancel": MessageLookupByLibrary.simpleMessage("Cancel"),
        "onboardingColorSubtitle": MessageLookupByLibrary.simpleMessage(
            "This is your colour. It will guide you through your wayfinding journey"),
        "onboardingColorTitle": MessageLookupByLibrary.simpleMessage("Colour"),
        "onboardingNext": MessageLookupByLibrary.simpleMessage("Next"),
        "onboardingStart": MessageLookupByLibrary.simpleMessage("Start"),
        "onboardingSummeryEnd": MessageLookupByLibrary.simpleMessage("to"),
        "onboardingSummeryStart": MessageLookupByLibrary.simpleMessage("from"),
        "onboardingSummeryTitle":
            MessageLookupByLibrary.simpleMessage("Summery"),
        "permissionsSubtitle": MessageLookupByLibrary.simpleMessage(
            "Leading requires Bluetooth and Location permissions. Make sure both are enabled to continue"),
        "permissionsTitle": MessageLookupByLibrary.simpleMessage("Welcome"),
        "trackerCompleteEnd": m1,
        "trackerCompleteQuit": MessageLookupByLibrary.simpleMessage("Complete"),
        "trackerCompleteSubtitle": MessageLookupByLibrary.simpleMessage(
            "You’ve reached your destination. your route will no longer be marked. Click Complete to start over!"),
        "trackerCompleteTitle":
            MessageLookupByLibrary.simpleMessage("We\'re here"),
        "trackerProgressEnd": m2,
        "trackerProgressQuit": MessageLookupByLibrary.simpleMessage("Quit"),
        "trackerProgressSubtitle": MessageLookupByLibrary.simpleMessage(
            "Follow your colour to your destination, we’ll Let you know once you get there! You can always quit if you want to."),
        "trackerProgressTitle":
            MessageLookupByLibrary.simpleMessage("Wayfinding in Progress")
      };
}
