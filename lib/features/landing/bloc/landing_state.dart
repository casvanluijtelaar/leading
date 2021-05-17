part of 'landing_bloc.dart';

abstract class LandingState extends Equatable {
  const LandingState();

  @override
  List<Object> get props => [];
}

class LandingLoading extends LandingState {}

class LandingComplete extends LandingState {}

class LandingError extends LandingState {
  const LandingError(this.exception);

  final Exception exception;

  @override
  List<Object> get props => [exception];
}
