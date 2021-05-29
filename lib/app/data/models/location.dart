import 'package:equatable/equatable.dart';

class Location extends Equatable {
  const Location({
    required this.name,
    required this.mac,
    required this.id,
  });

  factory Location.fromJson(Map json) => Location(
    id: json['id'],
    mac: json['mac'],
    name: json['name'],
  );

  final String name;
  final String mac;
  final int id;

  @override
  List<Object?> get props => [mac, name, id];

  @override
  bool get stringify => true;
}
