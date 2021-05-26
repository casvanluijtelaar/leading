import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leading/app/app_locator.dart';
import 'package:leading/app/data/models/location.dart';
import 'package:leading/app/utils/consts.dart';
import 'package:leading/app/widgets/button.dart';
import 'package:leading/app/widgets/loading.dart';

import 'package:leading/features/setup/bloc/setup_bloc.dart';

import '../bloc/location_start_bloc.dart';

class LocationStartPage extends StatelessWidget {
  const LocationStartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () => BlocProvider.of<SetupBloc>(context).add(
            SetupBack(),
          ),
        ),
      ),
      body: BlocProvider(
        create: (_) =>
            locator<LocationStartBloc>()..add(LocationStartEvent.started),
        child: const LocationStartView(),
      ),
    );
  }
}

class LocationStartView extends StatelessWidget {
  const LocationStartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<LocationStartBloc, LocationStartState>(
        bloc: context.read<LocationStartBloc>(),
        builder: (context, state) {
          if (state is LocationStartNotFound)
            return const LocationStartNotFoundView();
          if (state is LocationStartFound)
            return LocationStartFoundView(state.location);
          return const Loading();
        },
      );
}

/// found the users location, show it and allow them to proceed
class LocationStartFoundView extends StatelessWidget {
  const LocationStartFoundView(this.location, {Key? key}) : super(key: key);

  final Location location;

  @override
  Widget build(BuildContext context) => SizedBox.expand(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'starting point: ${location.name}',
              style: Theme.of(context).textTheme.headline6,
            ),
            Text(
              'Let\'s get started with the wayfinding proces',
              style: Theme.of(context).textTheme.subtitle2,
            ),
            Padding(
              padding: const EdgeInsets.all(Kpadding.large),
              child: Button(
                icon: Icons.arrow_downward,
                onPressed: () => BlocProvider.of<SetupBloc>(context).add(
                  SetupLocationStartCompleted(location),
                ),
              ),
            ),
          ],
        ),
      );
}

class LocationStartNotFoundView extends StatelessWidget {
  const LocationStartNotFoundView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('locatin not found'),
        MaterialButton(
          onPressed: () => BlocProvider.of<LocationStartBloc>(context).add(
            LocationStartEvent.started,
          ),
          child: const Text('retry'),
        ),
      ],
    );
  }
}
