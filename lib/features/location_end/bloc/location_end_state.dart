part of 'location_end_bloc.dart';

abstract class LocationEndState extends Equatable {
  const LocationEndState();

  @override
  List<Object> get props => [];
}

class LocationEndLoading extends LocationEndState {}

class LocationEndNotFound extends LocationEndState {}

class LocationEndFound extends LocationEndState {
  const LocationEndFound(this.locations);

  final List<Location> locations;

  @override
  List<Object> get props => locations;
}
