import 'package:noise_map_poc/noise_map_poc.dart';

/// {@template biome}
/// Describes a biome.
/// {@endtemplate}
abstract class Biome {
  /// {@macro biome}
  const Biome({required this.name});

  /// The name of the biome.
  final String name;

  /// The attributes of the biome.
  List<BiomeAttribute<Attribute>> get attributes;

  /// Checks if the given [conditions] for a cell are viable for the biome
  /// based on the [attributes] of the biome.
  bool isViable(TerrainConditions conditions) {
    return attributes.every((attribute) => conditions.satisfies(attribute));
  }
}
