import 'package:example/attributes/attributes.dart';
import 'package:habitat/habitat.dart';

class HigherMountain extends Biome {
  HigherMountain() : super(name: 'higher_mountain');

  final _elevation = const BiomeAttribute<Elevation>(
    range: Range(min: 0.7, max: 0.8),
  );

  @override
  bool isViable(TerrainConditions conditions) {
    return conditions.satisfies(_elevation);
  }
}
