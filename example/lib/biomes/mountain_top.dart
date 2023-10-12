import 'package:example/attributes/attributes.dart';
import 'package:habitat/habitat.dart';

class MountainTop extends Biome {
  const MountainTop() : super(name: 'mountain_top');

  static const _elevation = BiomeAttribute<Elevation>(
    range: Range(min: 0.8),
  );

  @override
  bool isViable(TerrainConditions conditions) {
    return conditions.satisfies(_elevation);
  }
}
