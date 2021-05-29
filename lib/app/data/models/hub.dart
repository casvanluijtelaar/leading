import 'package:equatable/equatable.dart';

class Hub extends Equatable {
  const Hub({
    required this.id,
    required this.direction,
  }) : assert(direction.length == 2);

  factory Hub.fromMap(Map data) => Hub(
    id: data['id'],
    direction: List<int>.from(data['direction']),
  );

  final int id;
  final List<int> direction;

  @override
  List<Object?> get props => [id, direction];


  Map<String, dynamic> toMap() => {
        'id': id,
        'direction': direction,
      };
}
