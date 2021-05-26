part of 'onboarding_bloc.dart';

abstract class OnboardingState extends Equatable {
  const OnboardingState();

  @override
  List<Object?> get props => [];
}

class OnboardingLoading extends OnboardingState {}

class OnboardingColor extends OnboardingState {
  const OnboardingColor(this.color);

  final Color color;

  @override
  List<Object?> get props => [color];
}

class OnboardingAnimation extends OnboardingState {
  const OnboardingAnimation(this.color);

  final Color color;

  @override
  List<Object?> get props => [color];
}

class OnboardingSummery extends OnboardingState {
  const OnboardingSummery(this.color, this.start, this.end);

  final Color color;
  final String start;
  final String end;

  @override
  List<Object?> get props => [];
}
