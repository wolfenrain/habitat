import 'package:flame/extensions.dart';
import 'package:noise_map_poc/noise_map_poc.dart';

class Elevation extends Attribute {
  Elevation()
      : super(
          name: 'elevation',
          value: NoiseValue(const NoiseSettings(octaves: 32)) -
              SquareGradientValue(size: Vector2.all(256)),
        );
}
