import 'package:fast_noise/fast_noise.dart';
import 'package:habitat/habitat.dart';

/// {@template noise_value}
/// A [Value] class that returns a value based on a noise generator.
/// {@endtemplate}
class NoiseValue extends Value {
  /// {@macro noise_value}
  ///
  /// Where the noise generator is Perlin.
  NoiseValue.perlin({
    int seed = 1337,
    double frequency = 0.2,
    int octaves = 3,
  }) {
    final perlin = PerlinNoise(seed: seed, frequency: frequency);
    _noise = (int x, int y) {
      var amplitude = 1.0;
      var freq = frequency;
      var noiseSum = 0.0;
      var amplitudeSum = 0.0;

      for (var i = 0; i < octaves; i++) {
        noiseSum += amplitude * perlin.getNoise2(x * freq, y * freq);
        amplitudeSum += amplitude;
        amplitude *= 0.5;
        freq *= 2;
      }
      return (noiseSum / amplitudeSum) / 2 + 0.5;
    };
  }

  late final double Function(int x, int y) _noise;

  @override
  double get(int x, int y) => _noise(x, y);
}
