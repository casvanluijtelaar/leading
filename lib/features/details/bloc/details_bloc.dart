import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:leading/features/details/repository/details_repository.dart';

part 'details_event.dart';
part 'details_state.dart';

class DetailsBloc extends Bloc<DetailsEvent, DetailsState> {
  DetailsBloc(this._repository) : super(DetailsLoading());

  final DetailsRepository _repository;

  @override
  Stream<DetailsState> mapEventToState(DetailsEvent event) async* {
    if (event is DetailsStarted) {
      yield DetailsLoading();
      final color = await _repository.getUniqueColor();
      final id = await _repository.getId();
      yield DetailsCompleted(color, id);
    }
  }
}
