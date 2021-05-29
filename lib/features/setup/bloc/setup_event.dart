part of 'setup_bloc.dart';

abstract class SetupEvent extends Equatable {
  const SetupEvent();

  @override
  List<Object> get props => [];
}

class SetupBack extends SetupEvent {}

class SetupPermissionCompleted extends SetupEvent {}

class SetupLocationStartCompleted extends SetupEvent {
  const SetupLocationStartCompleted(this.location);

  final Location location;

  @override
  List<Object> get props => [location];
}

class SetupLocationEndCompleted extends SetupEvent {
  const SetupLocationEndCompleted(this.location);

  final Location location;

  @override
  List<Object> get props => [location];
}

class SetupDetailsCompleted extends SetupEvent {
  const SetupDetailsCompleted(this.id, this.color, this.hubs);

  final String id;
  final Color color;
  final List<Hub> hubs;

  @override
  List<Object> get props => [id, color, hubs];
}
