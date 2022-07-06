import 'package:example/attributes/attributes.dart';
import 'package:habitat/habitat.dart';

class LowerMountain extends Biome {
  LowerMountain() : super(name: 'lower_mountain');

  final _elevation = const BiomeAttribute<Elevation>(
    range: Range(min: 0.65, max: 0.7),
  );

  @override
  bool isViable(TerrainConditions conditions) {
    return conditions.satisfies(_elevation);
  }
}
