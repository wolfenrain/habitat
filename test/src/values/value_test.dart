import 'package:habitat/habitat.dart';
import 'package:test/test.dart';

class _TestValue extends Value {
  @override
  double get(int x, int y) {
    return 0.5;
  }
}

void main() {
  group('Value', () {
    late Value value;

    setUp(() {
      value = _TestValue();
    });

    test('has get() method', () {
      expect(value.get(0, 0), 0.5);
    });

    group('subtracts', () {
      test('values from each other', () {
        expect(value.subtract(_TestValue()).get(0, 0), equals(0));
      });
    });

    group('adds', () {
      test('values together', () {
        expect(value.add(_TestValue()).get(0, 0), equals(1));
      });
    });

    group('constant', () {
      test('returns a constant value', () {
        final value = Value.constant(0.5);

        expect(value.get(0, 0), equals(0.5));
        expect(value.get(10, 0), equals(0.5));
        expect(value.get(0, 10), equals(0.5));
        expect(value.get(10, 10), equals(0.5));
      });
    });
  });
}
