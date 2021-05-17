import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:leading/app/app_router.dart';

import 'package:leading/app/data/src/bluetooth.dart';
import 'package:leading/features/landing/repository/landing_repository.dart';

part 'landing_state.dart';

enum LandingEvent { started, completed }

class LandingBloc extends Bloc<LandingEvent, LandingState> {
  LandingBloc(this._repository, this._router) : super(LandingLoading());

  final LandingRepository _repository;
  final AppRouter _router;

  @override
  Stream<LandingState> mapEventToState(LandingEvent event) async* {
    try {
      switch (event) {
        case LandingEvent.started:
          yield LandingLoading();
          await _repository.initializeBluetooth();
          yield LandingComplete();

          break;
        case LandingEvent.completed:
          yield LandingLoading();
          _router.navigateToRoute(AppRouter.start);
      }
    } on BluetoothExeption catch (e) {
      yield LandingError(BluetoothExeption(e.exception, e.trace));
    }
  }
}
