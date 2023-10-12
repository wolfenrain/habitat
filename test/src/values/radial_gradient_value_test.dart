import 'package:habitat/habitat.dart';
import 'package:test/test.dart';
import 'package:vector_math/vector_math_64.dart';

void main() {
  group('$RadialGradientValue', () {
    final size = Vector2.all(20);

    test('is a radial gradient that gets lighter closer to the middle', () {
      expect(RadialGradientValue(size: size).get(0, 0), closeTo(0.91, 0.01));
      expect(
        RadialGradientValue(size: size).get(
          (size.x * 0.25).toInt(),
          (size.y * 0.25).toInt(),
        ),
        closeTo(0.95, 0.01),
      );
      expect(
        RadialGradientValue(size: size).get(
          (size.x * 0.5).toInt(),
          (size.y * 0.5).toInt(),
        ),
        equals(1),
      );
      expect(
        RadialGradientValue(size: size).get(
          (size.x * 0.75).toInt(),
          (size.y * 0.75).toInt(),
        ),
        closeTo(0.95, 0.01),
      );
      expect(
        RadialGradientValue(size: size).get(size.x.toInt(), size.y.toInt()),
        closeTo(0.91, 0.01),
      );
    });
  });
}
