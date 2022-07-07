import 'package:habitat/habitat.dart';
import 'package:test/test.dart';

class _TestBiome extends Biome {
  _TestBiome() : super(name: 'test');

  @override
  bool isViable(TerrainConditions conditions) {
    return true;
  }
}

void main() {
  group('Biome', () {
    late Biome biome;

    setUp(() {
      biome = _TestBiome();
    });

    test('has name', () {
      expect(biome.name, 'test');
    });
  });
}
