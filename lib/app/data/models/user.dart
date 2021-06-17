import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart' hide Route;
import 'package:leading/app/data/models/location.dart';

import 'hub.dart';

/// {@template User}
/// Some shared docs
/// {@endtemplate}
class User extends Equatable {
  /// {@macro User}
  User({
    this.startLocation,
    this.endLocation,
    this.id,
    this.color,
    this.hubs,
  });

  /// user deserialisation. Microcontroller can only work with 8 bit for color
  /// information, therefore we can't store the color as a 32 bit integer and
  /// we have to split it up into its RGB elements
  factory User.fromMap(Map data) {
    final List<int> color = data['color'];

    return User(
      color: Color.fromRGBO(color[0], color[1], color[2], 1),
      id: data['id'],
    );
  }

  /// a [Location] object that stores the users current (start)location
  final Location? startLocation;
  /// the  [Location] the user want to end up at
  final Location? endLocation;
  /// unique id to identify user, usually v4 Uuid
  final String? id;
  /// unique color assigned to this user
  final Color? color;
  /// a list of hubs defining the users Route
  final List<Hub>? hubs;

  @override
  List<Object?> get props => [startLocation, endLocation, id, color];

  @override
  bool? get stringify => true;

  /// user serialisation. Microcontroller can only work with 8 bit for color
  /// information, therefore we can't store the color as a 32 bit integer and
  /// we have to split it up into its RGB elements
  Map<String, dynamic> toMap() => {
        'id': id,
        'color': [color?.red, color?.green, color?.blue],
        'hubs': hubs?.map((e) => e.toMap()).toList(),
      };

  /// create a new user object with potentially updated data
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
