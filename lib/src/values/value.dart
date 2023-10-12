/// {@template value}
/// Represents a value that can be retrieved at a given coordinate.
/// {@endtemplate}
abstract class Value {
  /// {@macro value}
  const Value();

  /// Returns a constant value for any given coordinate.
  const factory Value.constant(double value) = _ConstantValue.new;

  /// Add [other] to the current value.
  Value operator +(Value other) => _Operation(this, other, (a, b) => a + b);

  /// Subtract [other] to the current value.
  Value operator -(Value other) => _Operation(this, other, (a, b) => a - b);

  /// Multiply the current value by [other].
  Value operator *(Value other) => _Operation(this, other, (a, b) => a * b);

  /// Divide the current value by [other].
  Value operator /(Value other) => _Operation(this, other, (a, b) => a / b);

  /// Divide the current value by [other] and round it.
  Value operator ~/(Value other) =>
      _Operation(this, other, (a, b) => (a ~/ b).toDouble());

  /// Invert the value.
  Value operator -() => _Inverted(this);

  /// Returns the value at the given [x] and [y] coordinates.
  double get(int x, int y);
}

class _Inverted extends Value {
  const _Inverted(this.value);

  final Value value;

  @override
  double get(int x, int y) => 1 - value.get(x, y);
}

class _Operation extends Value {
  const _Operation(this.a, this.b, this.operation);

  final Value a;

  final Value b;

  final double Function(double, double) operation;

  @override
  double get(int x, int y) => operation(a.get(x, y), b.get(x, y));
}

class _ConstantValue extends Value {
  const _ConstantValue(this.value);

  final double value;

  @override
  double get(int x, int y) => value;
}
