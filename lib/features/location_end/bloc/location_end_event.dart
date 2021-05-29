part of 'location_end_bloc.dart';

abstract class LocationEndEvent extends Equatable {
  const LocationEndEvent();

  @override
  List<Object> get props => [];
}

class LocationEndInitial extends LocationEndEvent {
  const LocationEndInitial(this.user);

  final User user;

  @override
  List<Object> get props => [user];
}

class LocationEndStarted extends LocationEndEvent {}

class LocationEndCompleted extends LocationEndEvent {
  const LocationEndCompleted(this.location);

  final Location location;

  @override
  List<Object> get props => [location];
}
