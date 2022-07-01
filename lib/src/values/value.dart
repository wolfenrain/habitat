abstract class Value {
  Value operator -(Object other) {
    if (other is Value) {
      return _SubtractedValue(this, other);
    }
    return this;
  }

  Value operator +(Object other) {
    if (other is Value) {
      return _AdditionValue(this, other);
    }
    return this;
  }

  double get(int x, int y);
}

class _AdditionValue extends Value {
  _AdditionValue(this.left, this.right);

  final Value left;
  final Value right;

  @override
  double get(int x, int y) {
    return left.get(x, y) + right.get(x, y);
  }
}

class _SubtractedValue extends Value {
  _SubtractedValue(this.a, this.b);

  final Value a;
  final Value b;

  @override
  double get(int x, int y) => a.get(x, y) - b.get(x, y);
}
