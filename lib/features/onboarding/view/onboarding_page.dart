import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leading/generated/l10n.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:leading/app/app_locator.dart';
import 'package:leading/features/onboarding/view/onboarding_animation_view.dart';
import 'package:leading/features/onboarding/view/onboarding_color_view.dart';
import 'package:leading/features/onboarding/view/onboarding_summery_view.dart.dart';

import '../bloc/onboarding_bloc.dart';

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

  @override
  Widget build(BuildContext context) => Scaffold(
        body: BlocBuilder<OnboardingBloc, OnboardingState>(
          builder: (context, state) {
            if (state is OnboardingLoading) return const SizedBox.shrink();
            return PageView(
              controller: context.read<OnboardingBloc>().controller,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                const OnboardingColorView(),
                const OnboardingAnimationView(),
                const OnboardingSummeryView(),
              ],
            );
          },
        ),
        bottomNavigationBar: SafeArea(
          child: Container(
            width: double.infinity,
            height: 56,
            padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                MaterialButton(
                  onPressed: () =>
                      context.read<OnboardingBloc>().add(OnboardingBack()),
                  child: BlocBuilder<OnboardingBloc, OnboardingState>(
                    builder: (context, state) => Text(
                      state is OnboardingColor
                          ? S.current.onboardingCancel
                          : S.current.onboardingBack,
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ),
                ),
                SmoothPageIndicator(
                  controller: context.read<OnboardingBloc>().controller,
                  count: 3,
                  effect: WormEffect(
                    activeDotColor:
                        // ignore: avoid_dynamic_calls
                        Beamer.of(context).state.data['user'].color!,
                    dotColor: Theme.of(context).shadowColor,
                    dotHeight: 10,
                    dotWidth: 10,
                  ),
                  onDotClicked: (index) => context
                      .read<OnboardingBloc>()
                      .add(OnboardingSelected(index)),
                ),
                MaterialButton(
                  onPressed: () => context.read<OnboardingBloc>().add(
                        OnboardingForward(),
                      ),
                  child: BlocBuilder<OnboardingBloc, OnboardingState>(
                    builder: (context, state) => Text(
                      state is OnboardingSummery
                          ? S.current.onboardingStart
                          : S.current.onboardingNext,
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
