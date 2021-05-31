import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:leading/app/data/models/hub.dart';
import 'package:leading/app/data/models/user.dart';
import 'package:leading/features/details/repository/details_repository.dart';

part 'details_event.dart';
part 'details_state.dart';

class DetailsBloc extends Bloc<DetailsEvent, DetailsState> {
  DetailsBloc(this._repository) : super(DetailsLoading());

  final DetailsRepository _repository;

  late User _user;

  @override
  Stream<DetailsState> mapEventToState(DetailsEvent event) async* {
    if (event is DetailsInitial) {
      yield DetailsLoading();
      _user = event.user;
      add(DetailsStarted());
    }

    if (event is DetailsStarted) {
      yield DetailsLoading();

      final color = await _repository.getUniqueColor();
      final id = await _repository.getId();
      final route = await _repository.getRoute(_user);
      print(route);

      yield DetailsCompleted(color, id, route);
    }
  }
}
