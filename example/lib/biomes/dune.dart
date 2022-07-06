import 'package:example/attributes/attributes.dart';
import 'package:habitat/habitat.dart';

class Dune extends Biome {
  Dune() : super(name: 'dune');

  final _elevation = const BiomeAttribute<Elevation>(
    range: Range(min: 0.25, max: 0.3),
  );

  @override
  bool isViable(TerrainConditions conditions) {
    return conditions.satisfies(_elevation);
  }
}
