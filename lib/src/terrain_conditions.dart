import 'package:collection/collection.dart';
import 'package:habitat/habitat.dart';
import 'package:meta/meta.dart';

/// {@template terrain_conditions}
/// Describes a set of conditions that must be met for a cell to be valid.
/// {@endtemplate}
@immutable
class TerrainConditions {
  /// {@macro terrain_conditions}
  const TerrainConditions(this._attributeValueMap);

  final UnmodifiableMapView<Attribute, double> _attributeValueMap;

  /// Check if the given [attribute] satisfies the value in the
  /// [_attributeValueMap].
  bool satisfies<T extends Attribute>(BiomeAttribute<T> attribute) {
    final keys = _attributeValueMap.keys.whereType<T>();
    if (keys.isEmpty) return true;

    final value = _attributeValueMap[keys.first]!;
    return attribute.range.contains(value);
  }

  /// Get the value of the attribute.
  double? attribute<T extends Attribute>() {
    final keys = _attributeValueMap.keys.whereType<T>();
    if (keys.isEmpty) return null;
    return _attributeValueMap[keys.first];
  }

  @override
  bool operator ==(Object other) {
    if (other is TerrainConditions) {
      return const MapEquality<dynamic, dynamic>().equals(
        _attributeValueMap,
        other._attributeValueMap,
      );
    }
    return false;
  }

  @override
  int get hashCode => _attributeValueMap.hashCode;

  @override
  String toString() {
    return 'TerrainConditions: ${_attributeValueMap.entries.map((entry) {
      return '${entry.key.name}=${entry.value}';
    }).join(', ')}';
  }
}
