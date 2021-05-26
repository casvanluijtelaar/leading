import 'dart:math';

import 'package:flutter_beacon/flutter_beacon.dart';

class BeaconUtils {
  static Beacon getNearestBeacon(List<Beacon> beacons) => beacons.reduce(
        (prev, next) => prev.distance > next.distance ? prev : next,
      );
}

extension BeaconExtension on Beacon {
  double get distance {
    if (rssi == 0) return -1;

    final ratio = rssi * 1 / txPower!;
    return ratio < 1.0
        ? pow(ratio, 10).toDouble()
        : (0.89976) * pow(ratio, 7.7095) + 0.111;
  }
}
