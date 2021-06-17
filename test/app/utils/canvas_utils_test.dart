import 'package:flutter_test/flutter_test.dart';
import 'package:leading/app/utils/canvas_utils.dart';

void main() {
  test('expect 3 correctly calculated intermedian points', () {
    final start = const Offset(0, 0);
    final end = const Offset(0, 3);

    final points = CanvasUtils.getIntermedianPoints(start, end, 3);

    expect(points[0], const Offset(0, 0));
    expect(points[1], const Offset(0, 1));
    expect(points[2], const Offset(0, 2));
  });
}
