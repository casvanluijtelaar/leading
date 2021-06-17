import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leading/app/app_locator.dart';
import 'package:leading/app/widgets/button.dart';
import 'package:leading/app/widgets/card.dart';
import 'package:leading/features/details/bloc/details_bloc.dart';
import 'package:leading/features/setup/bloc/setup_bloc.dart';
import 'package:leading/generated/l10n.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (_) => locator<DetailsBloc>()
          ..add(DetailsInitial(context.read<SetupBloc>().user)),
        child: const DetailsView(),
      ),
    );
  }
}

class DetailsView extends StatelessWidget {
  const DetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
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
                      S.current.detailsTitle,
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    BlocBuilder<DetailsBloc, DetailsState>(
                      bloc: context.read<DetailsBloc>(),
                      builder: (context, state) {
                        if (state is DetailsCompleted)
                          return Text(
                            S.current.detailsSucces,
                            style: Theme.of(context).textTheme.bodyText1,
                            textAlign: TextAlign.center,
                          );
                        return Text(
                          S.current.detailsLoading,
                          style: Theme.of(context).textTheme.bodyText1,
                          textAlign: TextAlign.center,
                        );
                      },
                    ),
                    BlocBuilder<DetailsBloc, DetailsState>(
                      bloc: context.read<DetailsBloc>(),
                      builder: (context, state) {
                        if (state is DetailsCompleted)
                          return Button(
                            type: ButtonType.succes,
                            onPressed: () => context
                                .read<SetupBloc>()
                                .add(SetupDetailsCompleted(
                                  state.id,
                                  state.color,
                                  state.hubs,
                                )),
                          );
                        return const Button(type: ButtonType.loading);
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
