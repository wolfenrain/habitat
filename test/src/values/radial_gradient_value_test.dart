// ignore_for_file: prefer_const_declarations

import 'package:habitat/habitat.dart';
import 'package:test/test.dart';

void main() {
  group('$RadialGradientValue', () {
    final size = (x: 20, y: 20);

    test('is a radial gradient that gets lighter closer to the middle', () {
      expect(RadialGradientValue(size: size).get(0, 0), equals(0));
      expect(
        RadialGradientValue(size: size).get(
          (size.x * 0.25).toInt(),
          (size.y * 0.25).toInt(),
        ),
        closeTo(0.70, 0.01),
      );
      expect(
        RadialGradientValue(size: size).get(
          (size.x * 0.5).toInt(),
          (size.y * 0.5).toInt(),
        ),
        closeTo(1.41, 0.01),
      );
      expect(
        RadialGradientValue(size: size).get(
          (size.x * 0.75).toInt(),
          (size.y * 0.75).toInt(),
        ),
        closeTo(0.70, 0.01),
      );
      expect(
        RadialGradientValue(size: size).get(size.x, size.y),
        equals(0),
      );
    });
  });
}
