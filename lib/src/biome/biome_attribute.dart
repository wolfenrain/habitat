import 'package:noise_map_poc/noise_map_poc.dart';

/// {@template biome_attribute}
/// Describes an attribute for a biome by applying the [range] to the values
/// provides by the [Attribute].
/// {@endtemplate}
class BiomeAttribute<T extends Attribute> {
  /// {@macro biome_attribute}
  const BiomeAttribute({required this.range});

  /// The range within which the values provided by the [Attribute] are valid
  /// for the biome.
  final Range range;
}
