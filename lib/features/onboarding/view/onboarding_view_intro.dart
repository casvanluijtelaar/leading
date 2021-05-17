import 'package:coast/coast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leading/features/onboarding/bloc/onboarding_bloc.dart';

class OnboardingViewIntro extends StatelessWidget {
  const OnboardingViewIntro(this.hero, {Key? key}) : super(key: key);

  final String hero;

  @override
  Widget build(BuildContext context) {
    return Crab(
      tag: hero,
      child: Container(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            const Text('intro uitleg bla bla blaaaaa'),
            MaterialButton(
              onPressed: () => BlocProvider.of<OnboardingBloc>(context)
                  .add(OnboardingEvent.introCompleted),
              child: const Text('doooor'),
            ),
          ],
        ),
      ),
    );
  }
}
