import 'dart:math';

import 'package:vector_math/vector_math_64.dart' as v;

/// {@template simplex_noise}
/// A noise generator based on the Simplex algorithm.
/// {@endtemplate}
class SimplexNoise {
  /// {@macro simplex_noise}
  SimplexNoise({
    this.octaves = 3,
    this.frequency = 0.01,
    this.persistance = 0.5,
    int? seed,
  }) : _noise = v.SimplexNoise(Random(seed));

  final v.SimplexNoise _noise;

  /// The number of octaves to use.
  final int octaves;

  /// The starting frequency of the noise.
  final double frequency;

  /// The persistance of the noise.
  final double persistance;

  /// Generates a noise value between 0 and 1.
  double getSum(double x, double y) {
    var amplitude = 1.0;
    var frequency = this.frequency;
    var noiseSum = 0.0;
    var amplitudeSum = 0.0;

    for (var i = 0; i < octaves; i++) {
      noiseSum += amplitude * _noise.noise2D(x * frequency, y * frequency);
      amplitudeSum += amplitude;
      amplitude *= persistance;
      frequency *= 2;
    }
    return noiseSum / amplitudeSum; // set range back to 0-1
  }
}
