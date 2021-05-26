class Kpadding {
  static const double scale = 1.0;

  static const double small = 4.0 * scale;
  static const double medium = 8.0 * scale;
  static const double large = 16.0 * scale;
}

class Kduration {
  static const Duration short = Duration(milliseconds: 200);
  static const Duration normal = Duration(milliseconds: 400);
  static const Duration long = Duration(milliseconds: 800);
}
