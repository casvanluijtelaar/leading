part of 'tracker_bloc.dart';

abstract class TrackerEvent extends Equatable {
  const TrackerEvent();

  @override
  List<Object> get props => [];
}

class TrackerSetup extends TrackerEvent {
  const TrackerSetup(this.user);

  final User user;

  @override
  List<Object> get props => [user];
}

class TrackerTracking extends TrackerEvent {}

class TrackingCompleted extends TrackerEvent {}

class TrackerReset extends TrackerEvent {}