import 'package:coast/coast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leading/features/onboarding/bloc/onboarding_bloc.dart';

import '../onboarding.dart';

class OnboardingViewAnimation extends StatelessWidget {
  const OnboardingViewAnimation(this.hero, {Key? key}) : super(key: key);

  final String hero;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Crab(
          tag: hero,
          child: MaterialButton(
            onPressed: () => BlocProvider.of<OnboardingBloc>(context).add(
              OnboardingEvent.animationCompleted,
            ),
            child: const Text('dooorororr'),
          ),
        ),
      ],
    );
  }
}
