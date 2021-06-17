import 'package:equatable/equatable.dart';

/// {@template Location}
/// data class storing data received from BLE Beacons as a fixed location point
/// {@endtemplate}
class Location extends Equatable {
  /// {@macro Location}
  const Location({
    required this.name,
    required this.mac,
    required this.id,
  });

  /// location deserialistion
  factory Location.fromJson(Map json) => Location(
        id: json['id'],
        mac: json['mac'],
        name: json['name'],
      );

  /// a unique name linked to this location
  final String name;

  /// mac address used for uniquely identifying this location
  final String mac;

  /// id used for quick linking location and database entries
  final int id;

  @override
  List<Object?> get props => [mac, name, id];

  @override
  bool get stringify => true;
}
