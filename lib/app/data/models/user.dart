import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:leading/app/data/models/location.dart';

class User extends Equatable {
  User({this.startLocation, this.endLocation, this.id, this.color});

  final Location? startLocation;
  final Location? endLocation;
  final String? id;
  final Color? color;

  @override
  List<Object?> get props => [startLocation, endLocation, id, color];

  @override
  bool? get stringify => true;

  Map<String, dynamic> toMap() => {
        'id': id,
        'color': color?.value,
        'start': startLocation?.id,
        'end': endLocation?.id,
      };

  User copyWith({
    Location? startLocation,
    Location? endLocation,
    String? id,
    Color? color,
  }) {
    return User(
      startLocation: startLocation ?? this.startLocation,
      endLocation: endLocation ?? this.endLocation,
      id: id ?? this.id,
      color: color ?? this.color,
    );
  }
}
