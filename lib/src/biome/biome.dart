import 'package:habitat/habitat.dart';
import 'package:meta/meta.dart';

/// {@template biome}
/// Describes a biome.
/// {@endtemplate}
@immutable
abstract class Biome {
  /// {@macro biome}
  const Biome({required this.name});

  /// The name of the biome.
  final String name;

  /// Checks if the given [conditions] for a cell are viable for the biome
  /// based on the [Attribute]s of the biome.
  bool isViable(TerrainConditions conditions);

  @override
  bool operator ==(Object other) {
    if (other is Biome) return name == other.name;
    return false;
  }

  @override
  int get hashCode => name.hashCode;
}
