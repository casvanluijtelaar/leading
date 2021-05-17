import 'package:coast/coast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leading/app/app_locator.dart';

import '../bloc/onboarding_bloc.dart';
import 'onboarding_view_animation.dart';
import 'onboarding_view_color.dart';
import 'onboarding_view_intro.dart';
import 'onboarding_view_summery.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (_) => locator<OnboardingBloc>(),
        child: OnboardingView(),
      ),
    );
  }
}

class OnboardingView extends StatelessWidget {
  OnboardingView({Key? key}) : super(key: key);

  static const String hero = 'onboarding';

  final CoastController controller = CoastController();

  void toPage(int page) => controller.animateTo(
        beach: page,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );

  @override
  Widget build(BuildContext context) =>
      BlocListener<OnboardingBloc, OnboardingState>(
        bloc: context.read<OnboardingBloc>(),
        listener: (context, state) {
          switch (state) {
            case OnboardingState.intro:
              return toPage(0);
            case OnboardingState.color:
              return toPage(1);
            case OnboardingState.animation:
              return toPage(2);
            case OnboardingState.summery:
              return toPage(3);
          }
        },
        child: BlocBuilder<OnboardingBloc, OnboardingState>(
          bloc: context.read<OnboardingBloc>(),
          builder: (context, state) => Coast(
            controller: controller,
            allowImplicitScrolling: false,
            physics: const NeverScrollableScrollPhysics(),
            beaches: [
              Beach(builder: (context) => const OnboardingViewIntro(hero)),
              Beach(builder: (context) => const OnboardingViewColor(hero)),
              Beach(builder: (context) => const OnboardingViewAnimation(hero)),
              Beach(builder: (context) => const OnboardingViewSummery(hero)),
            ],
            observers: [CrabController()],
          ),
        ),
      );
}
