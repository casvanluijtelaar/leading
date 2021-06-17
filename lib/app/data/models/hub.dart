import 'package:equatable/equatable.dart';


/// {@template Hub}
/// An data class deserialising the Hub database object. It stores the hub id
/// and the direction currently display on the hub. 
/// {@endtemplate}
class Hub extends Equatable {
  /// {@macro Hub}
  const Hub({
    required this.id,
    required this.direction,
  }) : assert(direction.length == 2);

  /// Hub database object deserialisation
  factory Hub.fromMap(Map data) => Hub(
    id: data['id'],
    direction: List<int>.from(data['direction']),
  );


  /// unique identifier used for linking route hubs to actual hubs
  final int id;
  /// every hub has an incomming and outgoing direction. these are displayed as
  /// LED strips. every strip has it's own ID. so if this hub has a direction
  /// of [0, 1] that means this hub has an incomming animation at LED strip 0
  /// and an outgroing animation at strip 1
  final List<int> direction;

  @override
  List<Object?> get props => [id, direction];

  @override
  bool get stringify => true;

  /// Hub database object serialisation
  Map<String, dynamic> toMap() => {
        'id': id,
        'direction': direction,
      };
}
