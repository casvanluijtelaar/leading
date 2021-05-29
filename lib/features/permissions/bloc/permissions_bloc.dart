import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:leading/app/utils/consts.dart';
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
      await Future.delayed(Kduration.short);
      final hasPermissions = await _repository.getPermissions();

      yield hasPermissions
          ? PermissionsState.accepted
          : PermissionsState.declined;
    }
  }
}
