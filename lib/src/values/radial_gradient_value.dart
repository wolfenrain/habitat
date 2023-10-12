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

  double _distance(num x1, num y1, num x2, num y2) {
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
