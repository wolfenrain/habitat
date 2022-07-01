import 'package:noise_map_poc/noise_map_poc.dart';

/// {@template terrain_conditions}
/// Describes a set of conditions that must be met for a cell to be valid.
/// {@endtemplate}
class TerrainConditions {
  /// {@macro terrain_conditions}
  const TerrainConditions(this._attributeValueMap);

  final Map<Attribute, double> _attributeValueMap;

  /// Returns whether the given [attribute] is valid for the given [value].
  bool satisfies<T extends Attribute>(BiomeAttribute<T> attribute) {
    final key = _attributeValueMap.keys.whereType<T>().first;
    final value = _attributeValueMap[key];
    if (value == null) return true;
    return attribute.range.contains(value);
  }

  @override
  String toString() {
    return [
      'TerrainConditions {',
      ..._attributeValueMap.entries.map((entry) {
        return '${entry.key.toString()}: ${entry.value}';
      }),
      '}'
    ].join('\n');
  }
}
