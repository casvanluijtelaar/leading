part of 'location_end_bloc.dart';

abstract class LocationEndState extends Equatable {
  const LocationEndState();

  @override
  List<Object> get props => [];
}

class LocationEndLoading extends LocationEndState {}

class LocationEndError extends LocationEndState {
  const LocationEndError(this.exception);

  final Exception exception;

  @override
  List<Object> get props => [exception];
}

class LocationEndComplete extends LocationEndState {
  const LocationEndComplete(this.locations);

  final List<Location> locations;

  @override
  List<Object> get props => locations;
}
