import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leading/app/widgets/card.dart';
import 'package:leading/features/onboarding/bloc/onboarding_bloc.dart';
import 'package:leading/features/onboarding/widgets/dot_indicator.dart';

import '../onboarding.dart';

class OnboardingSummeryView extends StatelessWidget {
  const OnboardingSummeryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = context.read<OnboardingBloc>().user;

    return Scaffold(
      body: Column(
        children: [
          const Flexible(flex: 1, child: SizedBox.expand()),
          Flexible(
            flex: 5,
            child: BackgroundCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Summery',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  ListTile(
                    leading: Icon(Icons.location_on, color: user?.color),
                    title: const Text('from'),
                    subtitle: Text(user?.startLocation?.name ?? ''),
                  ),
                  Center(
                    child: SizedBox(
                      width: 50,
                      height: 100,
                      child: DotIndicator(
                        color: user?.color ?? Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                  ListTile(
                    trailing: Icon(Icons.location_on, color: user?.color),
                    title: const Text('to'),
                    subtitle: Text(user?.endLocation?.name ?? ''),
                  ),
                ],
              ),
            ),
          ),
          const Flexible(flex: 1, child: SizedBox.expand()),
        ],
      ),
    );
  }
}
