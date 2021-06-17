/// paddings used throughout the application
class Kpadding {
  /// user for quickly changing padding scale, to play with in app spacing
  static const double scale = 1.0;

  /// user for text and icon spacing
  static const double small = 4.0 * scale;

  /// used for component spacing
  static const double medium = 8.0 * scale;

  /// used for  layout spacing
  static const double large = 16.0 * scale;
}

/// durations used throughout the applications for animations
class Kduration {
  /// used for extreme short and quick animations, less then 200 pixel movement
  static const Duration short = Duration(milliseconds: 200);

  /// standard animation duration, page transitions, ...
  static const Duration normal = Duration(milliseconds: 400);

  /// extreme long animations, canvas animations, ...
  static const Duration long = Duration(milliseconds: 800);
}

/// used for quickly changing the BLE beacon ranging distance
class Kdistance {
  /// look for beacons as startposition within this distance
  static const double startDistance = 1.0;

  /// look for beacons as end point within this distance
  static const double endDistance = 1.2;
}
