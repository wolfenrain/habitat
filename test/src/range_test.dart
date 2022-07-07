// ignore_for_file: prefer_const_constructors

import 'package:habitat/habitat.dart';
import 'package:test/test.dart';

void main() {
  group('Range', () {
    test('can be instantiated', () {
      expect(Range(), isNotNull);
    });

    test('contains', () {
      final range = Range(min: 0.25, max: 0.75);

      expect(range.contains(0.1), isFalse);
      expect(range.contains(0.25), isTrue);
      expect(range.contains(0.5), isTrue);
      expect(range.contains(0.75), isTrue);
      expect(range.contains(0.8), isFalse);
    });
  });
}
