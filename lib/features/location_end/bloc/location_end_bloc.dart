import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:leading/app/app_locator.dart';
import 'package:leading/app/app_router.dart';
import 'package:leading/app/data/models/location.dart';
import 'package:leading/app/data/models/user.dart';

import '../repository/location_end_repository.dart';

part 'location_end_event.dart';
part 'location_end_state.dart';

class LocationEndBloc extends Bloc<LocationEndEvent, LocationEndState> {
  LocationEndBloc(this._repository, this._router, this._user)
      : super(LocationEndLoading());

  final LocationEndRepository _repository;
  final AppRouter _router;
  final User _user;

  @override
  Stream<LocationEndState> mapEventToState(LocationEndEvent event) async* {
    try {
      if (event is LocationEndStarted) {
        final locations = await _repository.getLocations();
        yield locations.isEmpty
            ? LocationEndError(NoLocationsException())
            : LocationEndComplete(locations);
        return;
      }

      if (event is LocationEndCompleted) {
        final user = _user.copyWith(endLocation: event.location);
        locator.resetLazySingleton(instance: user);
        _router.navigateToRoute(AppRouter.onboarding);
        return;
      }
    } on NoLocationsException {
      yield LocationEndError(NoLocationsException());
    } catch (e) {
      yield LocationEndError(e as Exception);
    }
  }
}
