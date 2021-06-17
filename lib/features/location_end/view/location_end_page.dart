import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leading/app/app_locator.dart';

import 'package:leading/app/widgets/button.dart';
import 'package:leading/app/widgets/card.dart';
import 'package:leading/features/location_end/bloc/location_end_bloc.dart';
import 'package:leading/features/setup/bloc/setup_bloc.dart';
import 'package:leading/generated/l10n.dart';

class LocationEndPage extends StatelessWidget {
  const LocationEndPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (_) => locator<LocationEndBloc>()
          ..add(LocationEndInitial(context.read<SetupBloc>().user)),
        child: const LocationEndView(),
      ),
    );
  }
}

class LocationEndView extends StatelessWidget {
  const LocationEndView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Column(
          children: [
            const Flexible(
              flex: 2,
              child: Center(
                child: Image(
                  image: AssetImage('assets/icon/icon_dark.png'),
                  width: 200,
                  height: 200,
                ),
              ),
            ),
            Flexible(
              flex: 3,
              child: BackgroundCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      S.current.locationEndTitle,
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    BlocBuilder<LocationEndBloc, LocationEndState>(
                      bloc: context.read<LocationEndBloc>(),
                      builder: (context, state) {
                        if (state is LocationEndNotFound)
                          return Text(
                            S.current.locationEndError,
                            style: Theme.of(context).textTheme.bodyText1,
                            textAlign: TextAlign.center,
                          );

                        return Text(
                          S.current.locationEndSucces,
                          style: Theme.of(context).textTheme.bodyText1,
                          textAlign: TextAlign.center,
                        );
                      },
                    ),
                    BlocBuilder<LocationEndBloc, LocationEndState>(
                      bloc: context.read<LocationEndBloc>(),
                      builder: (context, state) {
                        if (state is LocationEndFound)
                          return Expanded(
                            child: ListView.builder(
                              itemCount: state.locations.length,
                              itemBuilder: (context, index) => ListTile(
                                title: Text(state.locations[index].name),
                                leading: Icon(
                                  Icons.location_on,
                                  color: Theme.of(context).primaryColor,
                                ),
                                onTap: () => context
                                    .read<SetupBloc>()
                                    .add(SetupLocationEndCompleted(
                                      state.locations[index],
                                    )),
                              ),
                            ),
                          );
                        if (state is LocationEndNotFound)
                          return Button(
                            type: ButtonType.error,
                            onPressed: () => context
                                .read<LocationEndBloc>()
                                .add(LocationEndStarted()),
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
