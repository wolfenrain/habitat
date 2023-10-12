// ignore_for_file: prefer_const_constructors

import 'package:habitat/habitat.dart';
import 'package:test/test.dart';

class _TestValue extends Value {
  const _TestValue([this.value = 0.5]);

  final double value;

  @override
  double get(int x, int y) => value;
}

void main() {
  group('$Value', () {
    late Value value;

    setUp(() => value = _TestValue());

    test('get method returns expected value', () {
      expect(value.get(0, 0), 0.5);
    });

    test('add values together', () {
      expect((value + _TestValue()).get(0, 0), equals(1));
    });

    test('subtract values from each other', () {
      expect((value - _TestValue()).get(0, 0), equals(0));
    });

    test('multiply values from each other', () {
      expect((value * _TestValue()).get(0, 0), equals(0.25));
    });

    test('divide values from each other', () {
      expect((value / _TestValue(0.2)).get(0, 0), equals(2.5));
    });

    test('divide values from each other and round it', () {
      expect((value ~/ _TestValue(0.2)).get(0, 0), equals(2));
    });

    test('invert a value', () {
      expect((-_TestValue(0.2)).get(0, 0), equals(0.8));
    });

    test('create a constant value', () {
      final value = Value.constant(0.5);

      expect(value.get(0, 0), equals(0.5));
      expect(value.get(10, 0), equals(0.5));
      expect(value.get(0, 10), equals(0.5));
      expect(value.get(10, 10), equals(0.5));
    });
  });
}
