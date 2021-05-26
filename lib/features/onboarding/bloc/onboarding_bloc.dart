import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:leading/app/app_router.dart';
import 'package:leading/app/data/models/user.dart';

part 'onboarding_event.dart';
part 'onboarding_state.dart';

class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
  OnboardingBloc(this._router) : super(OnboardingLoading());

  final AppRouter _router;
  final String hero = 'onboarding';

  late User user;

  @override
  Stream<OnboardingState> mapEventToState(OnboardingEvent event) async* {
    if (event is OnboardingInitial) {
      user = event.user;
      yield OnboardingColor(user.color!);
    }

    if (event is OnboardingColorComplete) {
      yield OnboardingAnimation(user.color!);
    }

    if (event is OnboardingAnimationComplete) {
      yield OnboardingSummery(
        user.color!,
        user.startLocation!.name,
        user.endLocation!.name,
      );
    }

    if (state is OnboardingComplete) {
      yield OnboardingLoading();
      _router.navigateToRouteAdvanced(
        AppRouter.tracker,
        popToNamed: AppRouter.setup,
      );
    }
  }
}
