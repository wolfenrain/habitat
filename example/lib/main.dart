import 'dart:ui' as ui;

import 'package:binarize/binarize.dart';
import 'package:example/attributes/attributes.dart';
import 'package:example/biomes/biomes.dart';
import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:habitat/habitat.dart';

class HabitatExample extends FlameGame {
  @override
  Future<void> onLoad() async {
    camera.viewport = FixedResolutionViewport(_size);

    await add(
      WorldComponent(
        WorldGenerator(
          attributes: {ElevationInfinite(), Moisture()},
          biomes: {
            DeepOcean(),
            Ocean(),
            Beach(),
            Dune(),
            GrassLand(),
            Forest(),
            LowerMountain(),
            HigherMountain(),
            MountainTop(),
          },
          fallbackBiome: DeepOcean(),
        ),
      ),
    );
  }

  void replace(WorldGenerator generator, {bool move = false}) {
    firstChild<WorldComponent>()?.removeFromParent();
    add(WorldComponent(generator, move: move));
  }
}

class WorldComponent extends Component {
  WorldComponent(this.generator, {this.move = true});

  final WorldGenerator generator;

  final bool move;

  ui.Image? dataImage;
  final Vector2 offset = Vector2.zero();

  @override
  Future<void>? onLoad() {
    generateDataImage();
    return null;
  }

  @override
  void render(Canvas canvas) {
    if (dataImage == null) {
      return;
    }
    canvas.drawImage(dataImage!, Offset.zero, Paint());
    super.render(canvas);
  }

  bool generating = false;

  @override
  void update(double dt) {
    if (move && !generating) {
      offset.add(Vector2.all(10) * dt);
      generateDataImage();
    }
  }

  void generateDataImage() {
    generating = true;
    final payload = Payload.write();

    for (var y = 0; y < _size.y; y++) {
      for (var x = 0; x < _size.y; x++) {
        final biome = generator.getBiome(
          x + offset.x.toInt(),
          y + offset.y.toInt(),
        );

        final color = biome.color;
        payload
          ..set(uint8, color.red)
          ..set(uint8, color.green)
          ..set(uint8, color.blue)
          ..set(uint8, color.alpha);
      }
    }

    return ui.decodeImageFromPixels(
      binarize(payload),
      _size.x.toInt(),
      _size.y.toInt(),
      ui.PixelFormat.rgba8888,
      (image) {
        dataImage = image;
        generating = false;
      },
    );
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
      case 'lower_mountain':
        return const Color(0xFF616161);
      case 'higher_mountain':
        return const Color(0xFF9E9E9E);
      case 'mountain_top':
        return const Color(0xFFFFFFFF);
      default:
        throw Exception('Unknown biome $name');
    }
  }
}

final _size = Vector2.all(256);

void main() {
  final game = HabitatExample();
  runApp(
    MaterialApp(
      home: Column(
        children: [
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(width: 8),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    game.replace(
                      WorldGenerator(
                        attributes: {Elevation(), Moisture()},
                        biomes: {
                          DeepOcean(),
                          Ocean(),
                          Beach(),
                          Dune(),
                          GrassLand(),
                          Forest(),
                          LowerMountain(),
                          HigherMountain(),
                          MountainTop(),
                        },
                        fallbackBiome: DeepOcean(),
                      ),
                    );
                  },
                  child: const Text('Single island'),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    game.replace(
                      WorldGenerator(
                        attributes: {ElevationInfinite(), Moisture()},
                        biomes: {
                          DeepOcean(),
                          Ocean(),
                          Beach(),
                          Dune(),
                          GrassLand(),
                          Forest(),
                          LowerMountain(),
                          HigherMountain(),
                          MountainTop(),
                        },
                        fallbackBiome: DeepOcean(),
                      ),
                      move: true,
                    );
                  },
                  child: const Text('Infinite world with islands'),
                ),
              ),
              const SizedBox(width: 8),
            ],
          ),
          const SizedBox(height: 8),
          Expanded(child: GameWidget(game: game)),
        ],
      ),
    ),
  );
}
