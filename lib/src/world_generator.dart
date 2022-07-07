import 'dart:collection';

import 'package:habitat/habitat.dart';

/// {@template world_generator}
/// Procedurally generates a world based on a set of [attributes] and [biomes].
/// {@endtemplate}
class WorldGenerator {
  /// {@macro world_generator}
  const WorldGenerator({
    required this.attributes,
    required this.biomes,
    this.fallbackBiome,
  });

  /// The attributes that are used to determine the biome of a coordinate.
  final Set<Attribute> attributes;

  /// The biomes that are available for the world.
  final Set<Biome> biomes;

  /// The biome to use when no biome is found for a coordinate.
  final Biome? fallbackBiome;

  /// Returns the conditions for the given [x] and [y] coordinates.
  TerrainConditions getConditions(int x, int y) {
    return TerrainConditions(
      UnmodifiableMapView({
        for (final attribute in attributes)
          attribute: attribute.value.get(x, y).clamp(0, 1),
      }),
    );
  }

  /// Returns the biome for the given [x] and [y] coordinates. Based on the
  /// [TerrainConditions] of the coordinates.
  ///
  /// If no biome is found and [fallbackBiome] is not null, it will return
  /// [fallbackBiome] otherwise it will throw an [Exception].
  Biome getBiome(int x, int y) {
    final conditions = getConditions(x, y);

    return biomes.firstWhere(
      (biome) => biome.isViable(conditions),
      orElse: () {
        if (fallbackBiome != null) {
          return fallbackBiome!;
        }
        throw Exception('No biome found for $conditions');
      },
    );
  }
}
