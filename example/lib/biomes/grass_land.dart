import 'package:example/attributes/attributes.dart';
import 'package:noise_map_poc/noise_map_poc.dart';

class GrassLand extends Biome {
  const GrassLand() : super(name: 'grass_land');

  @override
  List<BiomeAttribute<Attribute>> get attributes => const [
        BiomeAttribute<Elevation>(range: Range(min: 0.3, max: 0.65)),
        BiomeAttribute<Moisture>(range: Range(max: 0.6))
      ];
}
