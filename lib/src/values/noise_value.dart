import 'package:noise_map_poc/noise_map_poc.dart';
import 'package:noise_map_poc/src/noise/noise.dart';

class NoiseValue extends Value {
  NoiseValue(NoiseSettings settings) : _noise = Noise(settings: settings);

  final Noise _noise;

  @override
  double get(int x, int y) {
    final noise = _noise.getSum(x.toDouble(), y.toDouble());
    return noise / 2 + 0.5; // Rescale from -1.0:+1.0 to 0.0:1.0
  }
}
