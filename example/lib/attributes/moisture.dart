import 'package:noise_map_poc/noise_map_poc.dart';

class Moisture extends Attribute {
  Moisture()
      : super(
          name: 'moisture',
          value: NoiseValue(const NoiseSettings(octaves: 32)),
        );
}
