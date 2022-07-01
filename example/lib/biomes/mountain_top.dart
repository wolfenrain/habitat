import 'package:example/attributes/attributes.dart';
import 'package:noise_map_poc/noise_map_poc.dart';

class MountainTop extends Biome {
  const MountainTop() : super(name: 'mountain_top');

  final _elevation = const BiomeAttribute<Elevation>(
    range: Range(min: 0.8),
  );

  @override
  bool isViable(TerrainConditions conditions) {
    return conditions.satisfies(_elevation);
  }
}
