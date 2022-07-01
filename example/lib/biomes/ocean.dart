import 'package:example/attributes/attributes.dart';
import 'package:noise_map_poc/noise_map_poc.dart';

class Ocean extends Biome {
  const Ocean() : super(name: 'ocean');

  final _elevation = const BiomeAttribute<Elevation>(
    range: Range(min: 0.1, max: 0.2),
  );

  @override
  bool isViable(TerrainConditions conditions) {
    return conditions.satisfies(_elevation);
  }
}
