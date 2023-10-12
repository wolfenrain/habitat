// ignore_for_file: prefer_const_constructors

import 'package:habitat/habitat.dart';
import 'package:test/test.dart';

class _TestBiome extends Biome {
  const _TestBiome() : super(name: 'test');

  @override
  bool isViable(TerrainConditions conditions) => true;
}

void main() {
  group('$Biome', () {
    late Biome biome;

    setUp(() => biome = _TestBiome());

    test('has a name', () => expect(biome.name, 'test'));

    test('same instance are equal', () {
      expect(biome, equals(_TestBiome()));
    });
  });
}
