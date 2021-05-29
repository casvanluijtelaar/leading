import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leading/app/app_locator.dart';
import 'package:leading/app/data/models/location.dart';
import 'package:leading/app/utils/consts.dart';
import 'package:leading/app/widgets/button.dart';
import 'package:leading/app/widgets/card.dart';

import 'package:leading/features/setup/bloc/setup_bloc.dart';

import '../bloc/location_start_bloc.dart';

class LocationStartPage extends StatelessWidget {
  const LocationStartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          locator<LocationStartBloc>()..add(LocationStartEvent.started),
      child: const LocationStartView(),
    );
  }
}

class LocationStartView extends StatelessWidget {
  const LocationStartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Column(
          children: [
            const Flexible(
              flex: 3,
              child: Center(child: FlutterLogo(size: 50)),
            ),
            Flexible(
              flex: 2,
              child: BackgroundCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'Location',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    BlocBuilder<LocationStartBloc, LocationStartState>(
                      builder: (context, state) {
                        if (state is LocationStartNotFound)
                          return Text(
                            // ignore: lines_longer_than_80_chars
                            'We couldn’t establish your current location. Are you in the right place? ',
                            style: Theme.of(context).textTheme.bodyText1,
                            textAlign: TextAlign.center,
                          );
                        if (state is LocationStartFound)
                          return Text(
                            // ignore: lines_longer_than_80_chars
                            'I see that you’re currently at ${state.location.name} let’s see where you want to go',
                            style: Theme.of(context).textTheme.bodyText1,
                            textAlign: TextAlign.center,
                          );
                        return Text(
                          // ignore: lines_longer_than_80_chars
                          'Looking for your location',
                          style: Theme.of(context).textTheme.bodyText1,
                          textAlign: TextAlign.center,
                        );
                      },
                    ),
                    BlocBuilder<LocationStartBloc, LocationStartState>(
                      builder: (context, state) {
                        if (state is LocationStartNotFound)
                          return Button(
                            type: ButtonType.error,
                            onPressed: () => context
                                .read<LocationStartBloc>()
                                .add(LocationStartEvent.started),
                          );
                        if (state is LocationStartFound)
                          return Button(
                            type: ButtonType.succes,
                            onPressed: () => context.read<SetupBloc>().add(
                                SetupLocationStartCompleted(state.location)),
                          );
                        return  Button(type: ButtonType.loading, onPressed: () {
                          
                        },);
                      },
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      );
}
