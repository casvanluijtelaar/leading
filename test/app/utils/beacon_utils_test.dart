import 'package:flutter_beacon/flutter_beacon.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:leading/app/utils/beacon_utils.dart';

void main() {
  test('return the beacon with the smallest distance', () {
    final beacons = List<Beacon>.generate(
        4,
        (index) => Beacon(
              accuracy: 1.0,
              major: 10,
              minor: 11,
              proximityUUID: index.toString(),
              macAddress: index.toString(),
              txPower: 10 + index,
              rssi: 55 + index,
            ));

    final beacon = BeaconUtils.getNearestBeacon(beacons);

    expect(beacon, beacons.first);
  });
}
