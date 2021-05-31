import 'package:flutter/painting.dart';

class CanvasUtils {
  /// providing a [start] and [end] coordinate, thi method will return
  /// a list of new points with length [amount] filled with points
  /// equidistantly spaced between those two points
  static List<Offset> getIntermedianPoints(
    Offset start,
    Offset end,
    int amount,
  ) {
    final offsets = <Offset>[];
    for (var i = 0; i < amount; i++) {
      final offset = Offset.lerp(start, end, (1 / amount) * i)!;
      offsets.add(offset);
    }
    return offsets;
  }
}
