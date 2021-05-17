import 'package:equatable/equatable.dart';

class Location extends Equatable {
  const Location({
    required this.name,
    required this.id,
    this.distance,
  });

  final String name;
  final String id;
  final double? distance;

  @override
  List<Object?> get props => [];

  @override
  bool get stringify => true;
}
