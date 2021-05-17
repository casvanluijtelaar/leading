import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leading/app/app_locator.dart';
import 'package:leading/app/data/models/location.dart';
import 'package:leading/features/location_end/bloc/location_end_bloc.dart';
import 'package:leading/features/location_end/repository/location_end_repository.dart';

class LocationEndPage extends StatelessWidget {
  const LocationEndPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (_) => locator<LocationEndBloc>()..add(LocationEndStarted()),
        child: const LocationEndView(),
      ),
    );
  }
}

class LocationEndView extends StatelessWidget {
  const LocationEndView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<LocationEndBloc, LocationEndState>(
        bloc: context.read<LocationEndBloc>(),
        builder: (context, state) {
          if (state is LocationEndComplete)
            return LocationsView(state.locations);
          if (state is LocationEndError) return ErrorView(state.exception);
          return const LoadingView();
        },
      );
}

class LoadingView extends StatelessWidget {
  const LoadingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator());
  }
}

class ErrorView extends StatelessWidget {
  const ErrorView(this.exception, {Key? key}) : super(key: key);

  final Exception exception;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(exception is NoLocationsException
            ? 'No locations'
            : 'database error'),
        MaterialButton(
          onPressed: () => BlocProvider.of<LocationEndBloc>(context).add(
            LocationEndStarted(),
          ),
          child: const Text('retry'),
        ),
      ],
    );
  }
}

class LocationsView extends StatelessWidget {
  const LocationsView(this.locations, {Key? key}) : super(key: key);

  final List<Location> locations;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: locations.length,
      itemBuilder: (context, index) => ListTile(
        onTap: () => BlocProvider.of<LocationEndBloc>(context).add(
          LocationEndCompleted(locations[index]),
        ),
        title: Text(locations[index].name),
        leading: const Icon(Icons.location_city),
      ),
    );
  }
}
