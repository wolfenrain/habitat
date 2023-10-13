import 'package:example/values/scatter_value.dart';
import 'package:habitat/habitat.dart';

class Elevation extends Attribute {
  Elevation(Seed seed)
      : this._(
          value: NoiseValue.perlin(seed: Seed.crc32(seed.generate())) -
              -(const RadialGradientValue(size: (x: 256, y: 256))),
        );

  Elevation._({required super.value}) : super(name: 'elevation');
}

class ElevationInfinite extends Elevation {
  ElevationInfinite(Seed seed)
      : super._(
          value: NoiseValue.perlin(seed: Seed.crc32(seed.generate())) -
              ScatterValue(scatter: 256).on(
                -const RadialGradientValue(size: (x: 256, y: 256)),
              ),
        );
}
