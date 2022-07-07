import 'package:habitat/habitat.dart';
import 'package:test/test.dart';

void main() {
  group('SimplexNoiseValue', () {
    test('returns a noise value from the coordinates', () {
      final value = SimplexNoiseValue(seed: 1337, octaves: 1);
      expect(value.get(1, 1), closeTo(0.087 / 2 + 0.5, 0.001));
    });
  });
}
