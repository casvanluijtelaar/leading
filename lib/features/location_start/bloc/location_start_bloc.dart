import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:leading/app/app_locator.dart';
import 'package:leading/app/app_router.dart';
import 'package:leading/app/data/models/location.dart';
import 'package:leading/app/data/models/user.dart';
import 'package:leading/app/data/src/bluetooth.dart';

import '../location_start.dart';

part 'location_start_event.dart';
part 'location_start_state.dart';

class LocationStartBloc extends Bloc<LocationStartEvent, LocationStartState> {
  LocationStartBloc(this._repository, this._router, this._user)
      : super(LocationStartLoading());

  final LocationStartRepository _repository;
  final AppRouter _router;
  final User _user;

  @override
  Stream<LocationStartState> mapEventToState(LocationStartEvent event) async* {
    try {
      if (event is LocationStartStarted) {
        yield LocationStartLoading();
        final location = await _repository.getLocation();
        yield LocationStartFound(location);
        return;
      }

      if (event is LocationStartCompleted) {
        final user = _user.copyWith(startLocation: event.location);
        locator.resetLazySingleton(instance: user);
        _router.navigateToRoute(AppRouter.end);
        return;
      }
    } on BluetoothExeption catch (e) {
      yield LocationStartError(e);
    } on LocationNotFoundException catch (e) {
      yield LocationStartError(e);
    }
  }
}
