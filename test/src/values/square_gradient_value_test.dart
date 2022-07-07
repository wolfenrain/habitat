import 'package:habitat/habitat.dart';
import 'package:test/test.dart';
import 'package:vector_math/vector_math_64.dart';

void main() {
  group('SquareGradientValue', () {
    final size = Vector2.all(20);

    test('is a square gradient that gets lighter closer to the middle', () {
      expect(SquareGradientValue(size: size).get(0, 0), equals(1));
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
        equals(0),
      );
      expect(
        SquareGradientValue(size: size).get(
          (size.x * 0.75).toInt(),
          (size.y * 0.75).toInt(),
        ),
        equals(0.5),
      );
      expect(
        SquareGradientValue(size: size).get(size.x.toInt(), size.y.toInt()),
        equals(1),
      );
    });
  });
}
