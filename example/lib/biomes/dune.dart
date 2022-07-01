import 'package:example/attributes/attributes.dart';
import 'package:noise_map_poc/noise_map_poc.dart';

class Dune extends Biome {
  const Dune() : super(name: 'dune');

  @override
  List<BiomeAttribute<Attribute>> get attributes => const [
        BiomeAttribute<Elevation>(range: Range(min: 0.25, max: 0.3)),
      ];
}
