import 'package:equatable/equatable.dart';

class Location extends Equatable {
  const Location({
    required this.name,
    required this.mac,
  });

  final String name;
  final String mac;


  @override
  List<Object?> get props => [mac, name];

  @override
  bool get stringify => true;
}
