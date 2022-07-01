import 'package:example/attributes/attributes.dart';
import 'package:noise_map_poc/noise_map_poc.dart';

class Forest extends Biome {
  const Forest() : super(name: 'forest');

  final _elevation = const BiomeAttribute<Elevation>(
    range: Range(min: 0.3, max: 0.65),
  );

  final _moisture = const BiomeAttribute<Moisture>(
    range: Range(min: 0.6),
  );

  @override
  bool isViable(TerrainConditions conditions) {
    return conditions.satisfies(_elevation) && conditions.satisfies(_moisture);
  }
}
