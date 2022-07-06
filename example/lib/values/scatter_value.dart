import 'package:habitat/habitat.dart';

class ScatterValue extends SimplexNoiseValue {
  ScatterValue({
    required this.scatter,
  }) : super(
          octaves: 32,
        );

  final int scatter;

  Value on(Value value) {
    return _ScatterValue(this, value);
  }
}

class _ScatterValue extends Value {
  _ScatterValue(this.parent, this.other);

  final ScatterValue parent;

  final Value other;

  @override
  double get(int x, int y) {
    final scatter = (parent.get(x, y) * parent.scatter).toInt();

    return other.get(x + scatter, y + scatter);
  }
}
