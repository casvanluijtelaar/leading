import 'dart:math';

import 'package:flutter_beacon/flutter_beacon.dart';

/// utility class from [Beacon] related methods
class BeaconUtils {
  /// compares a [list<Beacon>] and returns the [Beacon] where beacon.distance
  /// is the smallest
  static Beacon getNearestBeacon(List<Beacon> beacons) => beacons.reduce(
        (prev, next) => prev.distance > next.distance ? prev : next,
      );
}

/// extension methods for flutter_beacon's [Beacon] class
extension BeaconExtension on Beacon {
  /// roughly calculates distance between [Beacon] and the device running
  /// this application. based on:
  ///
  /// https://gist.github.com/alxsad/4b734cda26bab546ee6dac8258207b7f
  double get distance {
    if (rssi == 0) return -1;

    final ratio = rssi * 1 / txPower!;
    return ratio < 1.0
        ? pow(ratio, 10).toDouble()
        : (0.89976) * pow(ratio, 7.7095) + 0.111;
  }
}
