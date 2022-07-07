/// {@template value}
/// Represents a value that can be retrieved at a given coordinate.
/// {@endtemplate}
abstract class Value {
  /// {@macro value}
  const Value();

  /// Returns a constant value for any given coordinate.
  factory Value.constant(double value) => _ConstantValue(value);

  /// Returns a [Value] that subtracts this value from the [other] value.
  Value subtract(Value other) {
    return _SubtractedValue(this, other);
  }

  /// Returns a [Value] that adds this value to the [other] value.
  Value add(Value other) {
    return _AdditionValue(this, other);
  }

  /// Returns the value at the given [x] and [y] coordinates.
  double get(int x, int y);
}

class _AdditionValue extends Value {
  const _AdditionValue(this.a, this.b);

  final Value a;
  final Value b;

  @override
  double get(int x, int y) => a.get(x, y) + b.get(x, y);
}

class _SubtractedValue extends Value {
  const _SubtractedValue(this.a, this.b);

  final Value a;
  final Value b;

  @override
  double get(int x, int y) => a.get(x, y) - b.get(x, y);
}

class _ConstantValue extends Value {
  const _ConstantValue(this.value);

  final double value;

  @override
  double get(int x, int y) => value;
}
