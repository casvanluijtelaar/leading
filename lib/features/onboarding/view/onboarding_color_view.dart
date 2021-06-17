import 'package:blobs/blobs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leading/app/widgets/card.dart';
import 'package:leading/features/onboarding/bloc/onboarding_bloc.dart';
import 'package:leading/generated/l10n.dart';

import '../onboarding.dart';

class OnboardingColorView extends StatelessWidget {
  const OnboardingColorView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                    S.current.onboardingColorTitle,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  Text(
                    S.current.onboardingColorSubtitle,
                    style: Theme.of(context).textTheme.bodyText1,
                    textAlign: TextAlign.center,
                  ),
                  Blob.random(
                    size: 200,
                    styles: BlobStyles(
                      color: context.read<OnboardingBloc>().user?.color ??
                          Theme.of(context).primaryColor,
                      fillType: BlobFillType.fill,
                    ),
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
