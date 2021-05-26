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

class OnboardingColorComplete extends OnboardingEvent {}

class OnboardingAnimationComplete extends OnboardingEvent {}

class OnboardingComplete extends OnboardingEvent {}