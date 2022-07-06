/// {@template value}
/// Represents a value that can be retrieved at a given coordinate.
/// {@endtemplate}
abstract class Value {
  /// {@macro value}
  const Value();

  /// Returns a [Value] that subtracts this value from the [other] value.
  Value subtract(Object other) {
    if (other is Value) {
      return _SubtractedValue(this, other);
    }
    return this;
  }

  /// Returns a [Value] that adds this value to the [other] value.
  Value add(Object other) {
    if (other is Value) {
      return _AdditionValue(this, other);
    }
    return this;
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
