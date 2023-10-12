import 'package:example/attributes/attributes.dart';
import 'package:habitat/habitat.dart';

class DeepOcean extends Biome {
  const DeepOcean() : super(name: 'deep_ocean');

  static const _elevation = BiomeAttribute<Elevation>(
    range: Range(max: 0.1),
  );

  @override
  bool isViable(TerrainConditions conditions) {
    return conditions.satisfies(_elevation);
  }
}
