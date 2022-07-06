import 'package:habitat/habitat.dart';

class Moisture extends Attribute {
  Moisture()
      : super(
          name: 'moisture',
          value: SimplexNoiseValue(octaves: 32),
        );
}
