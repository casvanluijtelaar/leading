import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:leading/app/app_locator.dart';
import 'package:leading/app/app_router.dart';
import 'package:leading/app/data/models/user.dart';
import 'package:leading/features/onboarding/repository/onboarding_repository.dart';

enum OnboardingEvent {
  introCompleted,
  colorCompleted,
  animationCompleted,
  summeryCompleted,
}

enum OnboardingState {
  intro,
  color,
  animation,
  summery,
}

class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
  OnboardingBloc(this._repository, this._router, this._user)
      : super(OnboardingState.intro);

  final OnboardingRepository _repository;
  final AppRouter _router;
  final User _user;

  Color? get color => _user.color;

  @override
  Stream<OnboardingState> mapEventToState(OnboardingEvent event) async* {
    if (event == OnboardingEvent.introCompleted) {
      final color = await _repository.getUniqueColor();
      final user = _user.copyWith(color: color);
      locator.resetLazySingleton(instance: user);
      yield OnboardingState.color;
    }

    if (event == OnboardingEvent.colorCompleted) {
      final id = await _repository.getId();
      final user = _user.copyWith(id: id);
      locator.resetLazySingleton(instance: user);
      yield OnboardingState.animation;
    }

    if (event == OnboardingEvent.animationCompleted) {
      yield OnboardingState.summery;
    }

    if (event == OnboardingEvent.summeryCompleted) {
      _router.navigateToRoute(AppRouter.onboarding);
    }
  }
}
