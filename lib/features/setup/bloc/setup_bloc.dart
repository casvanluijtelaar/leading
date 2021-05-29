import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:leading/app/app_router.dart';
import 'package:leading/app/data/models/hub.dart';
import 'package:leading/app/data/models/location.dart';
import 'package:leading/app/data/models/user.dart';

/* enum SetupEvent {
  forward,
  backward,
  complete,
} */

part 'setup_event.dart';

enum SetupState {
  permisions,
  startLocation,
  endLocation,
  details,
}

class SetupBloc extends Bloc<SetupEvent, SetupState> {
  SetupBloc(this._router) : super(SetupState.permisions);

  final AppRouter _router;

  User user = User();


  @override
  Stream<SetupState> mapEventToState(SetupEvent event) async* {
    if (event is SetupPermissionCompleted) yield SetupState.startLocation;

    if (event is SetupLocationStartCompleted) {
      user = user.copyWith(startLocation: event.location);
      yield SetupState.endLocation;
    }

    if (event is SetupLocationEndCompleted) {
      user = user.copyWith(endLocation: event.location);
      yield SetupState.details;
    }

    if (event is SetupDetailsCompleted) {
      user = user.copyWith(color: event.color, id: event.id, hubs: event.hubs);
      _router.navigateToRoute(
        AppRouter.onboarding,
        data: {'user': user},
        popToNamed: AppRouter.setup,
      );
    }
  }
}
