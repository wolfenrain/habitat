import 'package:example/values/scatter_value.dart';
import 'package:flame/extensions.dart';
import 'package:habitat/habitat.dart';

class Elevation extends Attribute {
  Elevation({Value? value})
      : super(
          name: 'elevation',
          value: value ??
              SimplexNoiseValue(octaves: 32).subtract(
                SquareGradientValue(size: Vector2.all(256)),
              ),
        );
}

class ElevationInfinite extends Elevation {
  ElevationInfinite()
      : super(
          value: SimplexNoiseValue(octaves: 32).subtract(
            ScatterValue(scatter: 256).on(
              SquareGradientValue(size: Vector2.all(256)),
            ),
          ),
        );
}
