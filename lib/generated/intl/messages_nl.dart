// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a nl locale. All the
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
  String get localeName => 'nl';

  static String m0(name) =>
      "We zien dat je momenteel in ${name} bent, eens kijken waar je naartoe wilt";

  static String m1(location) => "Momenteel bij ${location}";

  static String m2(location) => "Naar ${location}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "buttonContinue": MessageLookupByLibrary.simpleMessage("Verder"),
        "buttonRetry": MessageLookupByLibrary.simpleMessage("Opnieuw"),
        "detailsLoading": MessageLookupByLibrary.simpleMessage(
            "Berekenen van de beste route"),
        "detailsSucces": MessageLookupByLibrary.simpleMessage(
            "We hebben de beste route berekend en wat achtergrond werk afgerond"),
        "detailsTitle":
            MessageLookupByLibrary.simpleMessage("Aan het afronden"),
        "locationEndError": MessageLookupByLibrary.simpleMessage(
            "We konden geen bestemmingen vinden, controlleer je internet verbinding."),
        "locationEndSucces":
            MessageLookupByLibrary.simpleMessage("Waar wil je naartoe?"),
        "locationEndTitle": MessageLookupByLibrary.simpleMessage("bestemming"),
        "locationStartError": MessageLookupByLibrary.simpleMessage(
            "We kunnen je locatie niet vinden, ben je op de juiste plaats?"),
        "locationStartLoading":
            MessageLookupByLibrary.simpleMessage("Zoeken naar je locatie"),
        "locationStartSucces": m0,
        "locationStartTitle": MessageLookupByLibrary.simpleMessage("Locatie"),
        "onboardingAnimationSubtitle": MessageLookupByLibrary.simpleMessage(
            "Jouw wayfinding route zal via LED animaties in jouw kleur weergeven worden, ze zullen ze naar je bestemming leiden"),
        "onboardingAnimationTitle":
            MessageLookupByLibrary.simpleMessage("Animatie"),
        "onboardingBack": MessageLookupByLibrary.simpleMessage("terug"),
        "onboardingCancel": MessageLookupByLibrary.simpleMessage("Annuleer"),
        "onboardingColorSubtitle": MessageLookupByLibrary.simpleMessage(
            "Dit is jouw kleur, het zal je door jouw wayfinding route leiden"),
        "onboardingColorTitle": MessageLookupByLibrary.simpleMessage("Kleur"),
        "onboardingNext": MessageLookupByLibrary.simpleMessage("Volgende"),
        "onboardingStart": MessageLookupByLibrary.simpleMessage("Start"),
        "onboardingSummeryEnd": MessageLookupByLibrary.simpleMessage("naar"),
        "onboardingSummeryStart": MessageLookupByLibrary.simpleMessage("van"),
        "onboardingSummeryTitle":
            MessageLookupByLibrary.simpleMessage("Samenvatting"),
        "permissionsSubtitle": MessageLookupByLibrary.simpleMessage(
            "Leading maakt gebruik van bluetooth en wifi, zorg dat beide aanstaan"),
        "permissionsTitle": MessageLookupByLibrary.simpleMessage("Welkom"),
        "trackerCompleteEnd": m1,
        "trackerCompleteQuit": MessageLookupByLibrary.simpleMessage("Afronden"),
        "trackerCompleteSubtitle": MessageLookupByLibrary.simpleMessage(
            "Je hebt je bestemming bereikt. De route wordt niet meer gemarkeerd. Druk op afronden om opnieuw te beginnen"),
        "trackerCompleteTitle":
            MessageLookupByLibrary.simpleMessage("We zijn er"),
        "trackerProgressEnd": m2,
        "trackerProgressQuit": MessageLookupByLibrary.simpleMessage("Stoppen"),
        "trackerProgressSubtitle": MessageLookupByLibrary.simpleMessage(
            "Volg jouw kleur naar je bestemming, we zullen je laten weten wanneer je er bent. Je kan altijd halverwege stoppen!"),
        "trackerProgressTitle":
            MessageLookupByLibrary.simpleMessage("Wayfinding bezig")
      };
}
