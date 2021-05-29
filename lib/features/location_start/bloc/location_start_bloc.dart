import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:leading/app/data/models/location.dart';
import '../location_start.dart';

part 'location_start_state.dart';

enum LocationStartEvent { started }

class LocationStartBloc extends Bloc<LocationStartEvent, LocationStartState> {
  LocationStartBloc(this._repository) : super(LocationStartLoading());

  final LocationStartRepository _repository;

  @override
  Stream<LocationStartState> mapEventToState(LocationStartEvent event) async* {
    try {
      if (event == LocationStartEvent.started) {
        yield LocationStartLoading();
        final location = await _repository.getLocation();

        yield location == null
            ? LocationStartNotFound()
            : LocationStartFound(location);
      }
    } catch (e, s) {
      log(e.toString(), stackTrace: s);
      yield LocationStartNotFound();
    }
  }
}
