import 'package:example/attributes/attributes.dart';
import 'package:habitat/habitat.dart';

class GrassLand extends Biome {
  const GrassLand() : super(name: 'grass_land');

  static const _elevation = BiomeAttribute<Elevation>(
    range: Range(min: 0.3, max: 0.65),
  );

  static const _moisture = BiomeAttribute<Moisture>(
    range: Range(max: 0.6),
  );

  @override
  bool isViable(TerrainConditions conditions) {
    return conditions.satisfies(_elevation) && conditions.satisfies(_moisture);
  }
}
