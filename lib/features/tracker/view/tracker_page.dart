import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leading/app/app_locator.dart';
import 'package:leading/app/widgets/button.dart';
import 'package:leading/app/widgets/card.dart';

import '../bloc/tracker_bloc.dart';

class TrackerPage extends StatelessWidget {
  const TrackerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Beamer.of(context).state.data['user'];
    return Scaffold(
      body: BlocProvider<TrackerBloc>(
        create: (_) => locator<TrackerBloc>()..add(TrackerSetup(user)),
        child: const TrackerView(),
      ),
    );
  }
}

class TrackerView extends StatelessWidget {
  const TrackerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => BlocBuilder<TrackerBloc, TrackerState>(
        bloc: context.read<TrackerBloc>(),
        builder: (context, state) {
          if (state is TrackerComplete) return const TrackerCompleteView();
          return const TrackerProgressView();
        },
      );
}

class TrackerProgressView extends StatelessWidget {
  const TrackerProgressView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        body: BackgroundCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'Wayfinding in Progress',
                style: Theme.of(context).textTheme.headline6,
              ),
              Text(
                // ignore: lines_longer_than_80_chars
                'Follow your colour to your destination, we’ll Let you know once you get there! You can always quit if you want to.',
                style: Theme.of(context).textTheme.bodyText1,
                textAlign: TextAlign.center,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.location_on,
                    size: 50,
                    color: context.read<TrackerBloc>().user!.color,
                  ),
                  Text(
                    // ignore: lines_longer_than_80_chars
                    'To: ${context.read<TrackerBloc>().user!.endLocation!.name}',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ],
              ),
              Button(
                type: ButtonType.succes,
                succes: 'Quit',
                onPressed: () => context.read<TrackerBloc>().add(
                      TrackerReset(),
                    ),
              ),
            ],
          ),
        ),
      );
}

class TrackerCompleteView extends StatelessWidget {
  const TrackerCompleteView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        body: BackgroundCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'We\'re here"',
                style: Theme.of(context).textTheme.headline6,
              ),
              Text(
                // ignore: lines_longer_than_80_chars
                'You’ve reached your desination. your route will no longer be marked. Click finish to start over!',
                style: Theme.of(context).textTheme.bodyText1,
                textAlign: TextAlign.center,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.location_on,
                    size: 50,
                    color: context.read<TrackerBloc>().user!.color,
                  ),
                  Text(
                    // ignore: lines_longer_than_80_chars
                    'Currently at ${context.read<TrackerBloc>().user!.endLocation!.name}',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ],
              ),
              Button(
                type: ButtonType.succes,
                succes: 'Complete',
                onPressed: () => context.read<TrackerBloc>().add(
                      TrackerReset(),
                    ),
              ),
            ],
          ),
        ),
      );
}
