import 'package:example/attributes/attributes.dart';
import 'package:noise_map_poc/noise_map_poc.dart';

class LowerMountain extends Biome {
  const LowerMountain() : super(name: 'lower_mountain');

  final _elevation = const BiomeAttribute<Elevation>(
    range: Range(min: 0.65, max: 0.7),
  );

  @override
  bool isViable(TerrainConditions conditions) {
    return conditions.satisfies(_elevation);
  }
}
