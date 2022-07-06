import 'package:example/attributes/attributes.dart';
import 'package:habitat/habitat.dart';

class GrassLand extends Biome {
  GrassLand() : super(name: 'grass_land');

  final _elevation = const BiomeAttribute<Elevation>(
    range: Range(min: 0.3, max: 0.65),
  );

  final _moisture = const BiomeAttribute<Moisture>(
    range: Range(max: 0.6),
  );

  @override
  bool isViable(TerrainConditions conditions) {
    return conditions.satisfies(_elevation) && conditions.satisfies(_moisture);
  }
}
