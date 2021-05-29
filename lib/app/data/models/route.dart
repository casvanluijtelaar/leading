import 'package:equatable/equatable.dart';
import 'package:leading/app/data/models/hub.dart';

class Route extends Equatable {
  const Route({
    required this.from,
    required this.to,
    required this.hubs,
  });

  factory Route.fromJson(Map data) {
    return Route(
      from: data['from'],
      to: data['to'],
      hubs: List<Map>.from(data['hubs']).map((d) => Hub.fromMap(d)).toList(),
    );
  }

  final int from;
  final int to;
  final List<Hub> hubs;

  @override
  List<Object?> get props => [from, to, hubs];
}
