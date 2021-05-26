import 'dart:convert';

class Beacon {
  const Beacon({
    required this.distance,
    required this.mac,
    required this.major,
    required this.minor,
    required this.uuid,
  });

  factory Beacon.fromJson(String json) {
    Map<String, dynamic> data = jsonDecode(json);

    return Beacon(
      distance: data['distance'],
      mac: data['macAdress'],
      major: data['major'],
      minor: data['minor'],
      uuid: data['uuid'],
    );
  }

  final String uuid;
  final String mac;
  final int major;
  final int minor;
  final double distance;

  @override
  bool operator ==(Object other) => other is Beacon && other.mac == mac;

  @override
  int get hashCode => runtimeType.hashCode ^ mac.hashCode;
}
