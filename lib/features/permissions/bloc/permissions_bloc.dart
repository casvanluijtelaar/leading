import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:leading/features/permissions/repository/permissions_repository.dart';

enum PermissionsEvent { started }

enum PermissionsState {
  loading,
  accepted,
  declined,
}

class PermissionsBloc extends Bloc<PermissionsEvent, PermissionsState> {
  PermissionsBloc(this._repository) : super(PermissionsState.loading);

  final PermissionsRepository _repository;

  @override
  Stream<PermissionsState> mapEventToState(PermissionsEvent event) async* {
    if (event == PermissionsEvent.started) {
      yield PermissionsState.loading;
      await _repository.getPermissions();

      final hasPermissions = await _repository.hasPermissions();

      yield hasPermissions
          ? PermissionsState.accepted
          : PermissionsState.declined;
    }
  }
}
