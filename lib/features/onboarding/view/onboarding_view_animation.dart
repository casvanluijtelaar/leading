import 'package:coast/coast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leading/features/onboarding/bloc/onboarding_bloc.dart';

import '../onboarding.dart';

class OnboardingViewAnimation extends StatelessWidget {
  const OnboardingViewAnimation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<OnboardingBloc>();
    final hero = bloc.hero;
    final color = (bloc.state as OnboardingAnimation).color;

    return Column(
      children: [
        Crab(
          tag: hero,
          child: Container(
            color: color,
            child: MaterialButton(
              onPressed: () => BlocProvider.of<OnboardingBloc>(context).add(
                OnboardingAnimationComplete(),
              ),
              child: const Text('dooorororr'),
            ),
          ),
        ),
      ],
    );
  }
}
