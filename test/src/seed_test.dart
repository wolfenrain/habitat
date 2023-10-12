// ignore_for_file: prefer_const_constructors

import 'dart:math';

import 'package:habitat/habitat.dart';
import 'package:test/test.dart';

void main() {
  group('$Seed', () {
    late Seed seed;

    setUp(() => seed = Seed());

    test('generate a new seed', () {
      expect(
        seed.generate(),
        isA<String>().having((s) => s.length, 'length', equals(32)),
      );

      expect(
        seed.generate(Random(1337)),
        equals('RJi41BbX1iIZf5tYzaQ2He7u0SwWtWG0'),
      );
    });

    test('creates a CRC32 hash', () {
      expect(Seed.crc32('test'), equals(3632233996));
    });
  });
}
