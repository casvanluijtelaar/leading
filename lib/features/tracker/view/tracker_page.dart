import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leading/app/app_locator.dart';

import '../bloc/tracker_bloc.dart';

class TrackerPage extends StatelessWidget {
  const TrackerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (_) => locator<TrackerBloc>(),
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
          return Container();
        },
      );
}
