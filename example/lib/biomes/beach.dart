import 'package:example/attributes/attributes.dart';
import 'package:noise_map_poc/noise_map_poc.dart';

class Beach extends Biome {
  const Beach() : super(name: 'beach');

  @override
  List<BiomeAttribute<Attribute>> get attributes => const [
        BiomeAttribute<Elevation>(range: Range(min: 0.2, max: 0.25)),
      ];
}
