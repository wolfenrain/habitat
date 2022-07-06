import 'package:example/attributes/attributes.dart';
import 'package:habitat/habitat.dart';

class Beach extends Biome {
  Beach() : super(name: 'beach');

  final _elevation = const BiomeAttribute<Elevation>(
    range: Range(min: 0.2, max: 0.25),
  );

  @override
  bool isViable(TerrainConditions conditions) {
    return conditions.satisfies(_elevation);
  }
}
