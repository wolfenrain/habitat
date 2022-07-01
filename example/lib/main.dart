import 'package:example/attributes/elevation.dart';
import 'package:example/attributes/moisture.dart';
import 'package:example/biomes/biomes.dart';
import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:noise_map_poc/noise_map_poc.dart';

void main() {
  runApp(GameWidget(game: NoiseMapPoc()));
}

final _mapSize = Vector2.all(512);

class NoiseMapPoc extends FlameGame {
  @override
  Future<void> onLoad() async {
    camera.viewport = FixedResolutionViewport(_mapSize);

    await add(NoiseMapComponent());
  }
}

class NoiseMapComponent extends PositionComponent {
  NoiseMapComponent();

  final WorldGenerator generator = WorldGenerator(
    attributes: {Elevation(), Moisture()},
    biomes: const {
      DeepOcean(),
      Ocean(),
      Beach(),
      Dune(),
      GrassLand(),
      Forest(),
    },
    fallbackBiome: const DeepOcean(),
  );

  @override
  void render(Canvas canvas) {
    for (var x = 0; x < _mapSize.x; x++) {
      for (var y = 0; y < _mapSize.y; y++) {
        final biome = generator.getBiome(x, y);

        canvas.drawRect(
          Rect.fromLTWH(x.toDouble(), y.toDouble(), 1, 1),
          Paint()
            ..color = biome.color
            ..isAntiAlias = false,
        );
      }
    }
  }
}

extension on Biome {
  Color get color {
    switch (name) {
      case 'ocean':
        return const Color(0xFF0952c6);
      case 'deep_ocean':
        return const Color(0xFF003eb2);
      case 'beach':
        return const Color(0xFFa49463);
      case 'dune':
        return const Color(0xFF807441);
      case 'grass_land':
        return const Color(0xFF4CAF50);
      case 'forest':
        return const Color(0xFF3c6114);
      default:
        throw Exception('Unknown biome $name');
    }
  }
}
