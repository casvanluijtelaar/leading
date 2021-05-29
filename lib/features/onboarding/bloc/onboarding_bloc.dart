import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:leading/app/app_router.dart';
import 'package:leading/app/data/models/user.dart';
import 'package:leading/app/utils/consts.dart';

part 'onboarding_event.dart';
part 'onboarding_state.dart';

class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
  OnboardingBloc(this._router) : super(OnboardingLoading());

  final AppRouter _router;
  final PageController controller = PageController();

  User? user;

  @override
  Stream<OnboardingState> mapEventToState(OnboardingEvent event) async* {
    if (event is OnboardingForward) yield* mapForwardToState();
    if (event is OnboardingBack) yield* mapBackwardToState();
    if (event is OnboardingSelected) yield* mapSelectedToState(event.index);
    if (event is OnboardingInitial) {
      user = event.user;
      yield OnboardingColor();
    }
  }

  Stream<OnboardingState> mapForwardToState() async* {
    if (state is OnboardingColor) {
      yield OnboardingAnimation();
      await animate(1);
    } else if (state is OnboardingAnimation) {
      yield OnboardingSummery();
      await animate(2);
    } else if (state is OnboardingSummery) {
      _router.navigateToRoute(
        AppRouter.tracker,
        data: {'user': user},
        popToNamed: AppRouter.setup,
      );
    }
  }

  Stream<OnboardingState> mapBackwardToState() async* {
    if (state is OnboardingColor) {
      _router.navigateToRoute(
        AppRouter.setup,
        data: {'user': user},
        popToNamed: AppRouter.setup,
      );
    } else if (state is OnboardingAnimation) {
      yield OnboardingColor();
      await animate(0);
    } else if (state is OnboardingSummery) {
      yield OnboardingAnimation();
      await animate(1);
    }
  }

  Stream<OnboardingState> mapSelectedToState(int page) async* {
    if (page == 0) yield OnboardingColor();
    if (page == 1) yield OnboardingAnimation();
    if (page == 2) yield OnboardingSummery();
    await animate(page);
  }

  Future<void> animate(int page) => controller.animateToPage(
        page,
        curve: Curves.easeInOut,
        duration: Kduration.normal,
      );

  @override
  Future<void> close() {
    controller.dispose();
    return super.close();
  }
}
