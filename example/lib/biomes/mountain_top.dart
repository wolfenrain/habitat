import 'package:example/attributes/attributes.dart';
import 'package:habitat/habitat.dart';

class MountainTop extends Biome {
  MountainTop() : super(name: 'mountain_top');

  final _elevation = const BiomeAttribute<Elevation>(
    range: Range(min: 0.8),
  );

  @override
  bool isViable(TerrainConditions conditions) {
    return conditions.satisfies(_elevation);
  }
}
