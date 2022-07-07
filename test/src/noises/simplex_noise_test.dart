import 'package:habitat/src/noises/noises.dart';
import 'package:test/test.dart';

void main() {
  group('SimplexNoise', () {
    test('can be instantiated', () {
      expect(SimplexNoise(), isNotNull);
    });

    group('noise2d', () {
      test('returns correct noise with a single octave', () {
        final noise = SimplexNoise(seed: 1337, octaves: 1);
        final noiseValue = noise.noise2d(1, 1);
        expect(noiseValue, closeTo(0.087, 0.001));
      });

      test('returns correct noise with multiple octaves', () {
        final noise = SimplexNoise(seed: 1337, octaves: 6);
        final noiseValue = noise.noise2d(1, 1);
        expect(noiseValue, closeTo(0.194, 0.001));
      });
    });
  });
}
