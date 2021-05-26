import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leading/app/app_locator.dart';
import 'package:leading/app/widgets/loading.dart';
import 'package:leading/features/permissions/bloc/permissions_bloc.dart';
import 'package:leading/features/setup/bloc/setup_bloc.dart';

class PermissionsPage extends StatelessWidget {
  const PermissionsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => BlocProvider<PermissionsBloc>(
        create: (_) =>
            locator<PermissionsBloc>()..add(PermissionsEvent.started),
        child: const PermissionsView(),
      );
}

class PermissionsView extends StatelessWidget {
  const PermissionsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<PermissionsBloc, PermissionsState>(
        builder: (context, state) {
          if (state == PermissionsState.declined)
            return const PermissionsDeclinedView();
          if (state == PermissionsState.accepted)
            return const PermissionsAcceptedView();
          return const Loading();
        },
      ),
    );
  }
}

class PermissionsDeclinedView extends StatelessWidget {
  const PermissionsDeclinedView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('permissions are required'),
        MaterialButton(
          onPressed: () => context.read<PermissionsBloc>().add(
                PermissionsEvent.started,
              ),
          child: const Text('retry'),
        ),
      ],
    );
  }
}

class PermissionsAcceptedView extends StatelessWidget {
  const PermissionsAcceptedView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('succes'),
        MaterialButton(
          onPressed: () => BlocProvider.of<SetupBloc>(context).add(
            SetupPermissionCompleted(),
          ),
          child: const Text('continue'),
        ),
      ],
    );
  }
}
