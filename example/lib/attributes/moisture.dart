import 'package:habitat/habitat.dart';

class Moisture extends Attribute {
  Moisture()
      : super(
          name: 'moisture',
          value: NoiseValue.perlin(octaves: 32),
        );
}
