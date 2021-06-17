import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:leading/app/utils/consts.dart';
import 'package:leading/app/widgets/card.dart';
import 'package:leading/features/onboarding/bloc/onboarding_bloc.dart';
import 'package:leading/generated/l10n.dart';

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
            flex: 3,
            child: BackgroundCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    S.current.onboardingSummeryTitle,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  Column(
                    children: [
                      ListTile(
                        title: Center(
                          child: Text(S.current.onboardingSummeryStart),
                        ),
                        subtitle: Center(
                            child: Text(user?.startLocation?.name ?? '')),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(Kpadding.large),
                        child: Center(
                          child: Transform.rotate(
                            angle: pi / 2,
                            child: SpinKitThreeBounce(
                              color: user?.color,
                              size: 50,
                            ),
                          ),
                        ),
                      ),
                      ListTile(
                        title: Center(
                          child: Text(S.current.onboardingSummeryEnd),
                        ),
                        subtitle:
                            Center(child: Text(user?.endLocation?.name ?? '')),
                      ),
                    ],
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
