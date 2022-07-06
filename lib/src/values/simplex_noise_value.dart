import 'package:habitat/habitat.dart';
import 'package:habitat/src/noise/noise.dart';

/// {@template simplex_noise_value}
/// A [Value] class that returns a value based on a Simplex noise generator.
/// {@endtemplate}
class SimplexNoiseValue extends Value {
  /// {@macro simplex_noise_value}
  SimplexNoiseValue({
    int octaves = 3,
    double frequency = 0.01,
    double persistance = 0.5,
    int? seed,
  }) : _noise = SimplexNoise(
          octaves: octaves,
          frequency: frequency,
          persistance: persistance,
          seed: seed,
        );

  final SimplexNoise _noise;

  @override
  double get(int x, int y) {
    final noise = _noise.getSum(x.toDouble(), y.toDouble());
    return noise / 2 + 0.5; // Rescale from -1.0:+1.0 to 0.0:1.0
  }
}
