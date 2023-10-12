import 'package:example/attributes/attributes.dart';
import 'package:habitat/habitat.dart';

class HigherMountain extends Biome {
  const HigherMountain() : super(name: 'higher_mountain');

  static const _elevation = BiomeAttribute<Elevation>(
    range: Range(min: 0.7, max: 0.8),
  );

  @override
  bool isViable(TerrainConditions conditions) {
    return conditions.satisfies(_elevation);
  }
}
