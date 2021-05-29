import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:leading/app/app_locator.dart';
import 'package:leading/app/utils/consts.dart';
import 'package:leading/features/details/details.dart';

import 'package:leading/features/location_end/location_end.dart';
import 'package:leading/features/location_start/location_start.dart';
import 'package:leading/features/permissions/permissions.dart';

import '../bloc/setup_bloc.dart';

class SetupPage extends StatelessWidget {
  const SetupPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (_) => locator<SetupBloc>(),
        child: SetupView(),
      );
}

class SetupView extends StatelessWidget {
  SetupView({Key? key}) : super(key: key);

  final PageController controller = PageController();

  void toPage(int page) => controller.animateToPage(
        page,
        duration: Kduration.normal,
        curve: Curves.fastOutSlowIn,
      );

  @override
  Widget build(BuildContext context) => BlocListener<SetupBloc, SetupState>(
        listener: (context, state) {
          if (state == SetupState.permisions) return toPage(0);
          if (state == SetupState.startLocation) return toPage(1);
          if (state == SetupState.endLocation) return toPage(2);
          if (state == SetupState.details) return toPage(3);
        },
        child: BlocBuilder<SetupBloc, SetupState>(
          builder: (context, state) => PageView(
            controller: controller,
            physics: const NeverScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            children: [
             const PermissionsPage(),
             const LocationStartPage(),
             const LocationEndPage(),
             const DetailsPage(),
            ],
          ),
        ),
      );
}
