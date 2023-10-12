import 'dart:math';

import 'package:habitat/habitat.dart';
import 'package:vector_math/vector_math_64.dart';

/// {@template radial_gradient_value}
/// A [Value] class that returns a value based on a radial gradient.
/// {@endtemplate}
class RadialGradientValue extends Value {
  /// {@macro radial_gradient_value}
  const RadialGradientValue({
    required Vector2 size,
    Vector2? offset,
    double density = 0,
  })  : _size = size,
        _offset = offset,
        _density = density;

  final Vector2 _size;

  final Vector2? _offset;

  final double _density;

  double _distance(double x1, double y1, double x2, double y2) {
    return sqrt((x2 - x1) * (x2 - x1) + (y2 - y1) * (y2 - y1));
  }

  @override
  double get(int x, int y) {
    final wrappedX = x % _size.x;
    final wrappedY = y % _size.y;
    if (wrappedX < (_offset?.x ?? 0) || wrappedY < (_offset?.y ?? 0)) {
      return 0;
    }

    final center = _size * 0.5;
    final d = _distance(center.x, center.y, wrappedX, wrappedY) *
        ((max(center.x, center.y) / max(_size.x, _size.y) + 0.1) * 0.01);
    return (1 - d) - _density;
  }
}
