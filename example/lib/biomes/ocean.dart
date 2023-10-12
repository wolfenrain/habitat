import 'package:example/attributes/attributes.dart';
import 'package:habitat/habitat.dart';

class Ocean extends Biome {
  const Ocean() : super(name: 'ocean');

  static const _elevation = BiomeAttribute<Elevation>(
    range: Range(min: 0.1, max: 0.2),
  );

  @override
  bool isViable(TerrainConditions conditions) {
    return conditions.satisfies(_elevation);
  }
}
