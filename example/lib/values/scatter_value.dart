import 'package:habitat/habitat.dart';

class ScatterValue extends NoiseValue {
  ScatterValue({
    required this.scatter,
  }) : super.perlin();

  final int scatter;

  Value on(Value value) => _ScatterValue(this, value);
}

class _ScatterValue extends Value {
  _ScatterValue(this.parent, this.other);

  final ScatterValue parent;

  final Value other;

  @override
  double get(int x, int y) {
    final newX = (parent.get(x, y) * parent.scatter).toInt();
    final newY = (parent.get(y, x) * parent.scatter).toInt();

    return other.get(x + newX, y + newY);
  }
}
