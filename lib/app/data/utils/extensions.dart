import 'dart:math';

import 'package:flutter_beacon/flutter_beacon.dart';

 // ignore_for_file: unnecessary_this



extension BeaconExtension on Beacon {

  /// gets the rough estimated distance to the beacon in meters
  double get distance =>
      pow(10, (this.txPower! - this.rssi) / (10 * 2)).toDouble();
}
