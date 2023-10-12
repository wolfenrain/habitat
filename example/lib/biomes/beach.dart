import 'package:example/attributes/attributes.dart';
import 'package:habitat/habitat.dart';

class Beach extends Biome {
  const Beach() : super(name: 'beach');

  static const _elevation = BiomeAttribute<Elevation>(
    range: Range(min: 0.2, max: 0.25),
  );

  @override
  bool isViable(TerrainConditions conditions) {
    return conditions.satisfies(_elevation);
  }
}
