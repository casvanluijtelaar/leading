part of 'onboarding_bloc.dart';

abstract class OnboardingState extends Equatable {
  const OnboardingState();

  @override
  List<Object?> get props => [];
}

class OnboardingLoading extends OnboardingState {}

class OnboardingColor extends OnboardingState {}

class OnboardingAnimation extends OnboardingState {}

class OnboardingSummery extends OnboardingState {}
