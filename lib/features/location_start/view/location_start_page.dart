import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leading/app/app_locator.dart';
import 'package:leading/app/data/models/location.dart';
import 'package:leading/app/data/src/bluetooth.dart';
import 'package:leading/features/location_start/repository/location_start_repository.dart';

import '../bloc/location_start_bloc.dart';

class LocationStartPage extends StatelessWidget {
  const LocationStartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (_) =>
            locator<LocationStartBloc>()..add(LocationStartStarted()),
        child: const LocationStartView(),
      ),
    );
  }
}

/// LocationStartView can have 4 states:
///  *  loading: location search is in progress
///  *  error: something went wrong during the search process
///  *  found: found his current location
///  *  not found: didnt't find the users location
class LocationStartView extends StatelessWidget {
  const LocationStartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<LocationStartBloc, LocationStartState>(
        bloc: context.read<LocationStartBloc>(),
        builder: (context, state) {
          if (state is LocationStartLoading)
            return const LocationStartLoading();
          if (state is LocationStartError)
            return LocationStartErrorView(state.exception);
          if (state is LocationStartFound)
            return LocationStartFoundView(state.location);
          return const LocationStartNotFoundView();
        },
      );
}

/// shows progress in th UI while we wait for the location fetching to complete
class LocationStartLoading extends StatelessWidget {
  const LocationStartLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator());
  }
}

/// something went wrong during the location fetching,
class LocationStartErrorView extends StatelessWidget {
  const LocationStartErrorView(this.exception, {Key? key}) : super(key: key);

  final Exception exception;

  @override
  Widget build(BuildContext context) {
    if (exception is BluetoothExeption)
      return const Center(child: Text('bluetooth error'));
    if (exception is LocationNotFoundException)
      return const Center(child: Text('couldnt find location'));

    return const Center(child: Text('unknown error'));
  }
}

/// couldnt find the users location, notifiy them and allow them to try again
class LocationStartNotFoundView extends StatelessWidget {
  const LocationStartNotFoundView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text('couldnt find location, try again?'),
        MaterialButton(
          onPressed: () => BlocProvider.of<LocationStartBloc>(context).add(
            LocationStartStarted(),
          ),
          child: const Text('retry'),
        ),
      ],
    );
  }
}

/// found the users location, show it and allow them to proceed
class LocationStartFoundView extends StatelessWidget {
  const LocationStartFoundView(this.location, {Key? key}) : super(key: key);

  final Location location;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(location.name),
        MaterialButton(
          onPressed: () => BlocProvider.of<LocationStartBloc>(context).add(
            LocationStartCompleted(location),
          ),
          child: const Text('continue'),
        ),
      ],
    );
  }
}
