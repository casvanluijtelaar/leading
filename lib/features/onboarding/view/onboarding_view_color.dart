import 'package:coast/coast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leading/features/onboarding/bloc/onboarding_bloc.dart';

import '../onboarding.dart';

class OnboardingViewColor extends StatelessWidget {
  const OnboardingViewColor(this.hero, {Key? key}) : super(key: key);

  final String hero;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('text kleur uitleg'),
        Crab(
          tag: hero,
          child: Container(
            width: 400,
            height: 400,
            color: BlocProvider.of<OnboardingBloc>(context).color,
          ),
        ),
        MaterialButton(
          onPressed: () => BlocProvider.of<OnboardingBloc>(context)
              .add(OnboardingEvent.colorCompleted),
          child: const Text('veerder'),
        ),
      ],
    );
  }
}
