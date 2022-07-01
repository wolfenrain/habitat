import 'package:example/attributes/attributes.dart';
import 'package:noise_map_poc/noise_map_poc.dart';

class DeepOcean extends Biome {
  const DeepOcean() : super(name: 'deep_ocean');

  final _elevation = const BiomeAttribute<Elevation>(
    range: Range(max: 0.1),
  );

  @override
  bool isViable(TerrainConditions conditions) {
    return conditions.satisfies(_elevation);
  }
}
