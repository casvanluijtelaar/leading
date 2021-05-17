part of 'location_start_bloc.dart';

abstract class LocationStartEvent extends Equatable {
  const LocationStartEvent();

  @override
  List<Object> get props => [];
}

class LocationStartStarted extends LocationStartEvent {}

class LocationStartCompleted extends LocationStartEvent {
  const LocationStartCompleted(this.location);

  final Location location;

  @override
  List<Object> get props => [location];
}
