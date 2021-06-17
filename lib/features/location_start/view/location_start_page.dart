import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leading/app/app_locator.dart';
import 'package:leading/app/widgets/button.dart';
import 'package:leading/app/widgets/card.dart';

import 'package:leading/features/setup/bloc/setup_bloc.dart';
import 'package:leading/generated/l10n.dart';

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
              child: Center(
                child: Image(
                  image: AssetImage('assets/icon/icon_dark.png'),
                  width: 200,
                  height: 200,
                ),
              ),
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
                            S.current.locationStartError,
                            style: Theme.of(context).textTheme.bodyText1,
                            textAlign: TextAlign.center,
                          );
                        if (state is LocationStartFound)
                          return Text(
                            S.current.locationStartSucces(state.location.name),
                            style: Theme.of(context).textTheme.bodyText1,
                            textAlign: TextAlign.center,
                          );
                        return Text(
                          S.current.locationStartLoading,
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
                          return Column(children: [
                            Button(
                              type: ButtonType.succes,
                              onPressed: () => context.read<SetupBloc>().add(
                                  SetupLocationStartCompleted(state.location)),
                            ),
                            TextButton(
                              onPressed: () => context
                                  .read<LocationStartBloc>()
                                  .add(LocationStartEvent.started),
                              child: Text(S.current.buttonRetry),
                            )
                          ]);

                        return Button(
                          type: ButtonType.loading,
                          onPressed: () {},
                        );
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
