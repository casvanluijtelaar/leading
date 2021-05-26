import 'package:beamer/beamer.dart';
import 'package:coast/coast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leading/app/app_locator.dart';
import 'package:leading/app/widgets/loading.dart';

import '../bloc/onboarding_bloc.dart';
import 'onboarding_view_animation.dart';
import 'onboarding_view_color.dart';
import 'onboarding_view_summery.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Beamer.of(context).state.data['user'];
    return Scaffold(
      body: BlocProvider(
        create: (_) => locator<OnboardingBloc>()..add(OnboardingInitial(user)),
        child: OnboardingView(),
      ),
    );
  }
}

class OnboardingView extends StatelessWidget {
  OnboardingView({Key? key}) : super(key: key);


  final CoastController controller = CoastController();

  void toPage(int page) => controller.animateTo(
        beach: page,
        duration: const Duration(milliseconds: 400),
      );

  @override
  Widget build(BuildContext context) =>
      BlocListener<OnboardingBloc, OnboardingState>(
        bloc: context.read<OnboardingBloc>(),
        listener: (context, state) {
          if (state is OnboardingColor) return toPage(0);
          if (state is OnboardingAnimation) return toPage(1);
          if (state is OnboardingSummery) return toPage(2);
        },
        child: BlocBuilder<OnboardingBloc, OnboardingState>(
          bloc: context.read<OnboardingBloc>(),
          builder: (context, state) => state is OnboardingLoading
              ? const Loading()
              : Coast(
                  controller: controller,
                  allowImplicitScrolling: false,
                  physics: const NeverScrollableScrollPhysics(),
                  beaches: [
                    Beach(builder: (context) {
                      return const OnboardingViewColor();
                    }),
                    Beach(builder: (context) {
                      return const OnboardingViewAnimation();
                    }),
                    Beach(builder: (context) {
                      return const OnboardingViewSummery();
                    }),
                  ],
                  observers: [CrabController()],
                ),
        ),
      );
}
