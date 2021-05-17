part of 'location_start_bloc.dart';

abstract class LocationStartState extends Equatable {
  const LocationStartState();

  @override
  List<Object> get props => [];
}

/// location is being searched for
class LocationStartLoading extends LocationStartState {}

/// couldn't find users location
class LocationStartNotFound extends LocationStartState {}

/// found users location, and provides it.
class LocationStartFound extends LocationStartState {
  const LocationStartFound(this.location);

  final Location location;

  @override
  List<Object> get props => [location];
}

/// something went wrong during fetching of the location
class LocationStartError extends LocationStartState {
  const LocationStartError(this.exception);

  final Exception exception;

  @override
  List<Object> get props => [exception];
}
