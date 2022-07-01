import 'package:example/attributes/attributes.dart';
import 'package:noise_map_poc/noise_map_poc.dart';

class Dune extends Biome {
  const Dune() : super(name: 'dune');

  final _elevation = const BiomeAttribute<Elevation>(
    range: Range(min: 0.25, max: 0.3),
  );

  @override
  bool isViable(TerrainConditions conditions) {
    return conditions.satisfies(_elevation);
  }
}
