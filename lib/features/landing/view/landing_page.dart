import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leading/app/app_locator.dart';
import 'package:leading/app/data/src/bluetooth.dart';
import 'package:leading/features/landing/bloc/landing_bloc.dart';

/// setting up the BlocProvider for the landing page
class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (_) => locator<LandingBloc>()..add(LandingEvent.started),
        child: const LandingView(),
      ),
    );
  }
}

/// LandingView can have 3 states:
///  *  loading: background services are being configured
///  *  error: something went wrong during the loading process
///  *  complete: loading finished sucessfully
class LandingView extends StatelessWidget {
  const LandingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => BlocBuilder<LandingBloc, LandingState>(
        bloc: context.read<LandingBloc>(),
        builder: (context, state) {
          if (state is LandingLoading) return const LandingLoadingView();
          if (state is LandingError)  return LandingErrorView(state.exception);
          return const LandingCompleteView();
        },
      );
}

/// when the app is loading up an animation should be displayed that gives an
/// indication of progress while the user interacts with stuff like permissions
class LandingLoadingView extends StatelessWidget {
  const LandingLoadingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator());
  }
}

/// when a problem occurs a message should be displayed telling the user
/// what the problem is and how to fix it
class LandingErrorView extends StatelessWidget {
  const LandingErrorView(this.exception, {Key? key}) : super(key: key);

  final Exception exception;

  @override
  Widget build(BuildContext context) {
    if (exception is BluetoothExeption)
      return const Center(child: Text('bluetooth error'));
    return const Center(child: Text('unknown error'));
  }
}

/// when the entire setup completes succesfully a user should be invited to
/// start the app. 
class LandingCompleteView extends StatelessWidget {
  const LandingCompleteView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: MaterialButton(
        onPressed: () => BlocProvider.of<LandingBloc>(context).add(
          LandingEvent.completed,
        ),
        child: const Icon(Icons.check),
      ),
    );
  }
}
