import 'package:example/attributes/attributes.dart';
import 'package:noise_map_poc/noise_map_poc.dart';

class DeepOcean extends Biome {
  const DeepOcean() : super(name: 'deep_ocean');

  @override
  List<BiomeAttribute<Attribute>> get attributes => const [
        BiomeAttribute<Elevation>(range: Range(max: 0.1)),
      ];
}
