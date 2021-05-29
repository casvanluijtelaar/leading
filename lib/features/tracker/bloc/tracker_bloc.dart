import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:leading/app/app_router.dart';
import 'package:leading/app/data/models/user.dart';
import 'package:leading/features/tracker/repository/tracker_repository.dart';

part 'tracker_event.dart';
part 'tracker_state.dart';

class TrackerBloc extends Bloc<TrackerEvent, TrackerState> {
  TrackerBloc(this._repository, this._router) : super(TrackerProgress());

  final TrackerRepository _repository;
  final AppRouter _router;

  User? user;

  @override
  Stream<TrackerState> mapEventToState(TrackerEvent event) async* {
    if (event is TrackerSetup) {
      user = event.user;
      await _repository.uploadUser(user!);
      _repository.reachedDestination(user!).listen(onTrackingEvent);
    }

    if (event is TrackerTracking) {
      yield TrackerProgress();
    }

    if (event is TrackingCompleted) {
      yield TrackerComplete();
    }

    if (event is TrackerReset) {
      await _repository.removeUser(user!);
      _router.navigateToRoute(AppRouter.setup, popToNamed: AppRouter.setup);
    }
  }

  void onTrackingEvent(bool reachedDestination) {
    if (reachedDestination) return add(TrackerTracking());
    return add(TrackingCompleted());
  }
}
