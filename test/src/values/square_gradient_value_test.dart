// ignore_for_file: prefer_const_declarations

import 'package:habitat/habitat.dart';
import 'package:test/test.dart';

void main() {
  group('$SquareGradientValue', () {
    final size = (x: 20, y: 20);

    test('is a square gradient that gets lighter closer to the middle', () {
      expect(SquareGradientValue(size: size).get(0, 0), equals(0));
      expect(
        SquareGradientValue(size: size).get(
          (size.x * 0.25).toInt(),
          (size.y * 0.25).toInt(),
        ),
        equals(0.5),
      );
      expect(
        SquareGradientValue(size: size).get(
          (size.x * 0.5).toInt(),
          (size.y * 0.5).toInt(),
        ),
        equals(1),
      );
      expect(
        SquareGradientValue(size: size).get(
          (size.x * 0.75).toInt(),
          (size.y * 0.75).toInt(),
        ),
        equals(0.5),
      );
      expect(
        SquareGradientValue(size: size).get(size.x, size.y),
        equals(0),
      );
    });
  });
}
