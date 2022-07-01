import 'dart:math';

import 'package:noise_map_poc/noise_map_poc.dart';
import 'package:vector_math/vector_math_64.dart';

class SquareGradientValue extends Value {
  SquareGradientValue({
    required Vector2 size,
    double density = 0,
  })  : _size = size,
        _density = density;

  final Vector2 _size;

  final double _density;

  @override
  double get(int x, int y) {
    final wrappedX = x % _size.x;
    final wrappedY = y % _size.y;

    final xValue = (wrappedX * 2 - _size.x).abs() / _size.x;
    final yValue = (wrappedY * 2 - _size.y).abs() / _size.y;
    return max(xValue, yValue) - _density;
  }
}
