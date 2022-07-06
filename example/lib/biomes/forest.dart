import 'package:example/attributes/attributes.dart';
import 'package:habitat/habitat.dart';

class Forest extends Biome {
  Forest() : super(name: 'forest');

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
