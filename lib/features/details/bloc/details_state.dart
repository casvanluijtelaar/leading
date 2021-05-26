part of 'details_bloc.dart';

abstract class DetailsState extends Equatable {
  const DetailsState();

  @override
  List<Object> get props => [];
}

class DetailsLoading extends DetailsState {}

class DetailsCompleted extends DetailsState {
  const DetailsCompleted(this.color, this.id);


  final Color color;
  final String id;


  @override
  List<Object> get props => [id, color];
}
