export 'src/attribute.dart';
export 'src/biome/biome.dart';
export 'src/biome/biome_attribute.dart';
export 'src/range.dart';
export 'src/seed.dart';
export 'src/terrain_conditions.dart';
export 'src/values/values.dart';
export 'src/world_generator.dart';

typedef Point = ({num x, num y});

extension PointX on Point {
  /// Multiply point by the given scale.
  Point operator *(num scale) => (x: x * scale, y: y * scale);
}
