import 'dart:math';

import 'package:habitat/habitat.dart';

/// {@template radial_gradient_value}
/// A [Value] class that returns a value based on a radial gradient.
/// {@endtemplate}
class RadialGradientValue extends Value {
  /// {@macro radial_gradient_value}
  const RadialGradientValue({
    required Point size,
    Point? offset,
    double density = 0,
  })  : _size = size,
        _offset = offset,
        _density = density;

  final Point _size;

  final Point? _offset;

  final double _density;

  double _euclideanDistance(num x1, num y1, num x2, num y2) {
    return sqrt(pow(x1 - x2, 2).abs() + pow(y1 - y2, 2).abs());
  }

  @override
  double get(int x, int y) {
    final wrappedX = x % _size.x;
    final wrappedY = y % _size.y;
    if (wrappedX < (_offset?.x ?? 0) || wrappedY < (_offset?.y ?? 0)) {
      return 0;
    }

    final center = _size * 0.5;

    final furthestDistanceFromCentre =
        _euclideanDistance(0, 0, center.x, center.y);

    final distance = furthestDistanceFromCentre -
        _euclideanDistance(x, y, center.x, center.y);
    return distance / max(center.x, center.y) - _density;
  }
}
