import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart' hide Route;
import 'package:leading/app/data/models/location.dart';

import 'hub.dart';

class User extends Equatable {
  User({this.startLocation, this.endLocation, this.id, this.color, this.hubs});

  factory User.fromMap(Map data) {
    return User(
      color: Color.fromRGBO(
        data['color'][0],
        data['color'][0],
        data['color'][0],
        1,
      ),
      id: data['id'],
    );
  }

  final Location? startLocation;
  final Location? endLocation;
  final String? id;
  final Color? color;
  final List<Hub>? hubs;

  @override
  List<Object?> get props => [startLocation, endLocation, id, color];

  @override
  bool? get stringify => true;

  Map<String, dynamic> toMap() => {
        'id': id,
        'color': [color?.red, color?.green, color?.blue],
        'hubs': hubs?.map((e) => e.toMap()).toList(),
      };

  User copyWith({
    Location? startLocation,
    Location? endLocation,
    String? id,
    Color? color,
    List<Hub>? hubs,
  }) {
    return User(
      startLocation: startLocation ?? this.startLocation,
      endLocation: endLocation ?? this.endLocation,
      id: id ?? this.id,
      color: color ?? this.color,
      hubs: hubs ?? this.hubs,
    );
  }
}
