// ignore_for_file: prefer_const_constructors

import 'dart:collection';

import 'package:habitat/habitat.dart';
import 'package:test/test.dart';

class _TestValue extends Value {
  @override
  double get(int x, int y) {
    return (((x + y) - 10) / (20 - 10)) / 2 + 0.5;
  }
}

class _TestAttribute extends Attribute {
  _TestAttribute() : super(name: 'test', value: _TestValue());
}

class _TestABiome extends Biome {
  _TestABiome() : super(name: 'test_a');

  final _testAttribute = BiomeAttribute<_TestAttribute>(
    range: Range(min: 0.5, max: 0.6),
  );

  @override
  bool isViable(TerrainConditions conditions) {
    return conditions.satisfies(_testAttribute);
  }
}

class _TestBBiome extends Biome {
  _TestBBiome() : super(name: 'test_b');

  final _testAttribute = BiomeAttribute<_TestAttribute>(range: Range(max: 0.4));

  @override
  bool isViable(TerrainConditions conditions) {
    return conditions.satisfies(_testAttribute);
  }
}

class _TestCBiome extends Biome {
  _TestCBiome() : super(name: 'test_c');

  @override
  bool isViable(TerrainConditions conditions) => false;
}

void main() {
  group('WorldGenerator', () {
    test('can be instantiated', () {
      expect(WorldGenerator(attributes: {}, biomes: {}), isNotNull);
    });

    test('returns the terrain conditions for the given coordinates', () {
      final testAttribute = _TestAttribute();
      final generator = WorldGenerator(
        attributes: {testAttribute},
        biomes: {},
      );

      expect(
        generator.getConditions(5, 5),
        TerrainConditions(UnmodifiableMapView({testAttribute: 0.5})),
      );
    });

    group('getBiome', () {
      test('returns the biome for the given coordinates', () {
        final testAttribute = _TestAttribute();
        final generator = WorldGenerator(
          attributes: {testAttribute},
          biomes: {
            _TestABiome(),
            _TestBBiome(),
          },
        );

        expect(generator.getBiome(5, 5), isA<_TestABiome>());
        expect(generator.getBiome(2, 2), isA<_TestBBiome>());
      });

      test(
        'returns fallback biome if none is satisfied for the given coordinates',
        () {
          final testAttribute = _TestAttribute();
          final generator = WorldGenerator(
            attributes: {testAttribute},
            biomes: {
              _TestABiome(),
              _TestBBiome(),
            },
            fallbackBiome: _TestCBiome(),
          );

          expect(generator.getBiome(7, 7), isA<_TestCBiome>());
        },
      );

      test('throw exception if none is satisfied for the given coordinates',
          () {
        final testAttribute = _TestAttribute();
        final generator = WorldGenerator(
          attributes: {testAttribute},
          biomes: {
            _TestABiome(),
            _TestBBiome(),
          },
        );

        expect(() => generator.getBiome(7, 7), throwsException);
      });
    });
  });
}
