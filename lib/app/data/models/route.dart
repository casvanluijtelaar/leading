import 'package:equatable/equatable.dart';
import 'package:leading/app/data/models/hub.dart';


/// {@template route}
/// data class for the Route database object, not used in the application
/// but an effecient way to store information shared between the mobile 
/// application and the microcontrollers
///
/// every route has a [from] and [to] point and a list of hubs that mark the 
/// route inbetween
/// {@endtemplate}
class Route extends Equatable {
  /// {@macro route}
  const Route({
    required this.from,
    required this.to,
    required this.hubs,
  });

  /// deserialise [Map<String, dynamic>] to [Route] object
  factory Route.fromJson(Map data) {
    return Route(
      from: data['from'],
      to: data['to'],
      hubs: List<Map>.from(data['hubs']).map((d) => Hub.fromMap(d)).toList(),
    );
  }

  /// the start location ID
  final int from;
  /// the end location ID
  final int to;
  /// a list of LED hubs that mark the route between the [from] & [to] locations
  final List<Hub> hubs;

  @override
  List<Object?> get props => [from, to, hubs];
}
