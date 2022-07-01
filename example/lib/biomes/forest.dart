import 'package:example/attributes/attributes.dart';
import 'package:noise_map_poc/noise_map_poc.dart';

class Forest extends Biome {
  const Forest() : super(name: 'forest');

  @override
  List<BiomeAttribute<Attribute>> get attributes => const [
        BiomeAttribute<Elevation>(range: Range(min: 0.3, max: 0.65)),
        BiomeAttribute<Moisture>(range: Range(min: 0.6))
      ];
}
