import 'package:coast/coast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leading/features/onboarding/bloc/onboarding_bloc.dart';

import '../onboarding.dart';

class OnboardingViewSummery extends StatelessWidget {
  const OnboardingViewSummery({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<OnboardingBloc>();
    final hero = bloc.hero;

    final color = (bloc.state as OnboardingSummery).color;
    final start = (bloc.state as OnboardingSummery).start;
    final end = (bloc.state as OnboardingSummery).end;

    return Column(
      children: [
        Text('van: $start, to: $end'),
        Crab(
          tag: hero,
          child: Container(
            width: 400,
            height: 400,
            color: color,
          ),
        ),
        MaterialButton(
          onPressed: () => bloc.add(
            OnboardingComplete(),
          ),
          child: const Text('start'),
        ),
      ],
    );
  }
}
