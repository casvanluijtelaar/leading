import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'tracker_event.dart';
part 'tracker_state.dart';

class TrackerBloc extends Bloc<TrackerEvent, TrackerState> {
  TrackerBloc() : super(TrackerInitial());

  @override
  Stream<TrackerState> mapEventToState(
    TrackerEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
