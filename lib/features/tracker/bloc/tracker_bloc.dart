import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:leading/app/app_router.dart';
import 'package:leading/app/data/models/user.dart';
import 'package:leading/app/utils/consts.dart';
import 'package:leading/features/tracker/repository/tracker_repository.dart';
import 'package:vibration/vibration.dart';
import 'package:flutter_beep/flutter_beep.dart';

part 'tracker_event.dart';
part 'tracker_state.dart';

class TrackerBloc extends Bloc<TrackerEvent, TrackerState> {
  TrackerBloc(this._repository, this._router) : super(TrackerInitial());

  final TrackerRepository _repository;
  final AppRouter _router;

  User? user;
  bool completed = false;

  @override
  Stream<TrackerState> mapEventToState(TrackerEvent event) async* {
    if (event is TrackerSetup) {
      user = event.user;
      await _repository.uploadUser(user!);
      yield TrackerProgress();
      _repository
          .reachedDestination(user!, Kdistance.endDistance)
          .listen(onTrackingEvent);
    }

    if (event is TrackingCompleted) {
      await _repository.removeUser(user!);
      yield TrackerComplete();
    }

    if (event is TrackerReset) {
      await _repository.removeUser(user!);
      _router.navigateToRoute(AppRouter.setup, popToNamed: AppRouter.setup);
    }
  }

  void onTrackingEvent(bool reachedDestination) {
    if (completed || !reachedDestination) return;
    completed = true;
    Vibration.vibrate(duration: 500);
    FlutterBeep.beep();
    add(TrackingCompleted());
  }
}
