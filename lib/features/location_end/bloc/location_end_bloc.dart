import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:leading/app/data/models/location.dart';
import 'package:leading/app/data/models/user.dart';

import '../repository/location_end_repository.dart';

part 'location_end_event.dart';
part 'location_end_state.dart';

class LocationEndBloc extends Bloc<LocationEndEvent, LocationEndState> {
  LocationEndBloc(this._repository) : super(LocationEndLoading());

  final LocationEndRepository _repository;

  late User _user;

  @override
  Stream<LocationEndState> mapEventToState(LocationEndEvent event) async* {
    if (event is LocationEndInitial) {
      yield LocationEndLoading();
      _user = event.user;
      add(LocationEndStarted());
    }

    if (event is LocationEndStarted) {
      final locations = await _repository.getLocations(_user.startLocation!);
      yield locations.isEmpty
          ? LocationEndNotFound()
          : LocationEndFound(locations);
    }
  }
}
