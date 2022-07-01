import 'dart:math';

import 'package:noise_map_poc/src/noise/noise_settings.dart';
import 'package:vector_math/vector_math_64.dart';

class Noise {
  /// {@macro noise}
  Noise({
    this.settings = const NoiseSettings(),
    int? seed,
  }) : _noise = SimplexNoise(Random(seed));

  final SimplexNoise _noise;

  /// The settings used for noise generation.
  final NoiseSettings settings;

  /// Generates a noise value between 0 and 1.
  double getSum(double x, double y) {
    var amplitude = 1.0;
    var frequency = settings.startFrequency;
    var noiseSum = 0.0;
    var amplitudeSum = 0.0;

    for (var i = 0; i < settings.octaves; i++) {
      noiseSum += amplitude * _noise.noise2D(x * frequency, y * frequency);
      amplitudeSum += amplitude;
      amplitude *= settings.persistance;
      frequency *= 2;
    }
    return noiseSum / amplitudeSum; // set range back to 0-1
  }
}
