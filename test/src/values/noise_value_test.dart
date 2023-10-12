import 'package:habitat/habitat.dart';
import 'package:test/test.dart';

void main() {
  group('$NoiseValue', () {
    group('perlin', () {
      test('returns a noise value from the coordinates', () {
        final value = NoiseValue.perlin();
        expect(value.get(2, 1), closeTo(0.458, 0.001));
      });
    });
  });
}
