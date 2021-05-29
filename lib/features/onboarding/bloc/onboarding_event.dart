part of 'onboarding_bloc.dart';

/* enum OnboardingEvent {
  introCompleted,
  colorCompleted,
  animationCompleted,
  summeryCompleted,
}
 */
abstract class OnboardingEvent extends Equatable {
  const OnboardingEvent();

  @override
  List<Object?> get props => [];
}

class OnboardingInitial extends OnboardingEvent {
  const OnboardingInitial(this.user);

  final User user;

  @override
  List<Object?> get props => [user];
}

class OnboardingBack extends OnboardingEvent {}

class OnboardingForward extends OnboardingEvent {}

class OnboardingSelected extends OnboardingEvent {
  const OnboardingSelected(this.index);

  final int index;

  @override
  List<Object?> get props => [index];
}
