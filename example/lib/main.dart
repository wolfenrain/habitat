import 'dart:async';
import 'dart:ui' as ui;

import 'package:binarize/binarize.dart';
import 'package:example/attributes/attributes.dart';
import 'package:example/biomes/biomes.dart';
import 'package:flame/camera.dart';
import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:habitat/habitat.dart';

const seed = Seed();

class HabitatExample extends FlameGame {
  @override
  Future<void> onLoad() async {
    camera.viewport = FixedSizeViewport(_size.x, _size.y);

    await add(
      WorldComponent(
        WorldGenerator(
          attributes: {Elevation(seed), Moisture()},
          biomes: {
            const DeepOcean(),
            const Ocean(),
            const Beach(),
            const Dune(),
            const GrassLand(),
            const Forest(),
            const LowerMountain(),
            const HigherMountain(),
            const MountainTop(),
          },
          fallbackBiome: const DeepOcean(),
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
  WorldComponent(this.generator, {this.move = false});

  final WorldGenerator generator;

  final bool move;

  ui.Image? dataImage;
  final Vector2 offset = Vector2.zero();

  @override
  void onLoad() => generateDataImage();

  @override
  void render(Canvas canvas) {
    if (dataImage == null) return;
    canvas.drawImage(dataImage!, Offset.zero, Paint());
    super.render(canvas);
  }

  @override
  void update(double dt) {
    if (!move || dataImage == null) return;
    offset.add(Vector2.all(10) * dt);
    generateDataImage();
  }

  void generateDataImage() {
    dataImage = null;
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
      (image) => dataImage = image,
    );
  }
}

extension on Biome {
  Color get color {
    return switch (this) {
      Ocean() => const Color(0xFF0952c6),
      DeepOcean() => const Color(0xFF003eb2),
      Beach() => const Color(0xFFa49463),
      Dune() => const Color(0xFF807441),
      GrassLand() => const Color(0xFF4CAF50),
      Forest() => const Color(0xFF3c6114),
      LowerMountain() => const Color(0xFF616161),
      HigherMountain() => const Color(0xFF9E9E9E),
      MountainTop() => const Color(0xFFFFFFFF),
      _ => throw Exception('Unknown biome $name'),
    };
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
                        attributes: {
                          Elevation(seed),
                          Moisture(),
                        },
                        biomes: {
                          const DeepOcean(),
                          const Ocean(),
                          const Beach(),
                          const Dune(),
                          const GrassLand(),
                          const Forest(),
                          const LowerMountain(),
                          const HigherMountain(),
                          const MountainTop(),
                        },
                        fallbackBiome: const DeepOcean(),
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
                        attributes: {
                          ElevationInfinite(seed),
                          Moisture(),
                        },
                        biomes: {
                          const DeepOcean(),
                          const Ocean(),
                          const Beach(),
                          const Dune(),
                          const GrassLand(),
                          const Forest(),
                          const LowerMountain(),
                          const HigherMountain(),
                          const MountainTop(),
                        },
                        fallbackBiome: const DeepOcean(),
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
