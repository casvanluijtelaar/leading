part of 'details_bloc.dart';

abstract class DetailsEvent extends Equatable {
  const DetailsEvent();

  @override
  List<Object> get props => [];
}

class DetailsInitial extends DetailsEvent {
  const DetailsInitial(this.user);

  final User user;

  @override
  List<Object> get props => [user];
}

class DetailsStarted extends DetailsEvent {}
