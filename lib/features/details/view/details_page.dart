import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leading/app/app_locator.dart';
import 'package:leading/app/widgets/loading.dart';
import 'package:leading/features/details/bloc/details_bloc.dart';
import 'package:leading/features/setup/bloc/setup_bloc.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (_) => locator<DetailsBloc>()..add(DetailsStarted()),
        child: const DetailsView(),
      ),
    );
  }
}

class DetailsView extends StatelessWidget {
  const DetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => BlocBuilder<DetailsBloc, DetailsState>(
        bloc: context.read<DetailsBloc>(),
        builder: (context, state) {
          if (state is DetailsCompleted)
            return DetailsCompletedView(state.color, state.id);
          return const Loading();
        },
      );
}

class DetailsCompletedView extends StatelessWidget {
  const DetailsCompletedView(this.color, this.id, {Key? key}) : super(key: key);

  final Color color;
  final String id;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('finished background work'),
        MaterialButton(
          onPressed: () =>
              context.read<SetupBloc>().add(SetupDetailsCompleted(id, color)),
          child: const Text('lets get started'),
        ),
      ],
    );
  }
}
