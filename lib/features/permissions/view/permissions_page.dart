import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:leading/app/app_locator.dart';
import 'package:leading/app/utils/consts.dart';
import 'package:leading/app/widgets/button.dart';
import 'package:leading/app/widgets/card.dart';
import 'package:leading/features/setup/bloc/setup_bloc.dart';

import '../bloc/permissions_bloc.dart';

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
                    'Permissions',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  Text(
                    '''Leading requires Bluetooth and Location permissions. Make sure both are enabled to continue ''',
                    style: Theme.of(context).textTheme.bodyText1,
                    textAlign: TextAlign.center,
                  ),
                  BlocBuilder<PermissionsBloc, PermissionsState>(
                    builder: (context, state) {
                      if (state == PermissionsState.declined)
                        return Button(
                          type: ButtonType.error,
                          onPressed: () => context
                              .read<PermissionsBloc>()
                              .add(PermissionsEvent.started),
                        );
                      if (state == PermissionsState.accepted)
                        return Button(
                          type: ButtonType.succes,
                          onPressed: () => context
                              .read<SetupBloc>()
                              .add(SetupPermissionCompleted()),
                        );
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
}
