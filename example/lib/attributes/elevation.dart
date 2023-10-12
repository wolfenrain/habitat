import 'package:example/values/scatter_value.dart';
import 'package:flame/extensions.dart';
import 'package:habitat/habitat.dart';

class Elevation extends Attribute {
  Elevation(Seed seed)
      : this._(
          value: NoiseValue.perlin(seed: Seed.crc32(seed.generate())) -
              -(RadialGradientValue(size: Vector2.all(256)) -
                  const Value.constant(0.05)) +
              (RadialGradientValue(size: Vector2.all(256)) -
                  const Value.constant(0.05)),
        );

  Elevation._({required super.value}) : super(name: 'elevation');
}

class ElevationInfinite extends Elevation {
  ElevationInfinite(Seed seed)
      : super._(
          value: NoiseValue.perlin(seed: Seed.crc32(seed.generate())) -
              ScatterValue(scatter: 256).on(
                -RadialGradientValue(size: Vector2.all(256)),
              ),
        );
}
