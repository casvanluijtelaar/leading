import 'package:leading/app/data/src/bluetooth.dart';

class LandingRepository {
  const LandingRepository(this._bluetooth);

  final Bluetooth _bluetooth;

  Future<void> initializeBluetooth() async {
    return _bluetooth.initialize();
  }
}
