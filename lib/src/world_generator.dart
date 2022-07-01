import 'package:noise_map_poc/noise_map_poc.dart';

class WorldGenerator {
  const WorldGenerator({
    required this.attributes,
    required this.biomes,
    this.fallbackBiome,
  });

  final Set<Attribute> attributes;

  final Set<Biome> biomes;

  final Biome? fallbackBiome;

  Biome getBiome(int x, int y) {
    final terrainConditions = TerrainConditions({
      for (final attribute in attributes) attribute: attribute.value.get(x, y),
    });

    for (final biome in biomes) {
      if (biome.isViable(terrainConditions)) {
        return biome;
      }
    }
    if (fallbackBiome != null) {
      return fallbackBiome!;
    }
    throw Exception('No biome found for $terrainConditions');
  }
}
