import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leading/app/utils/consts.dart';
import 'package:leading/app/widgets/card.dart';
import 'package:leading/features/onboarding/bloc/onboarding_bloc.dart';
import 'package:leading/features/onboarding/widgets/animation_indicator.dart';

import '../onboarding.dart';

class OnboardingAnimationView extends StatelessWidget {
  const OnboardingAnimationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(Kpadding.large),
        child: BackgroundCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'Animation',
                style: Theme.of(context).textTheme.headline6,
              ),
              Text(
                // ignore: lines_longer_than_80_chars
                'Your wayfinding route will be displayed by LED animations in your colour, they will guide you to your destination.',
                style: Theme.of(context).textTheme.bodyText1,
                textAlign: TextAlign.center,
              ),
              Flexible(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: Kpadding.large,
                    horizontal: 50,
                  ),
                  child: AnimationIndicator(
                    color: context.read<OnboardingBloc>().user?.color ??
                        Theme.of(context).primaryColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
