// import 'dart:math';

// import 'package:noise_map_poc/src/noise/noise.dart';
// import 'package:noise_map_poc/src/noise/noise_settings.dart';
// import 'package:vector_math/vector_math_64.dart';

// class IslandGenerator {
//   IslandGenerator(
//     this._size, {
//     this.density = 0.25,
//     int? seed,
//   })  : _heightMapNoise = Noise(
//           settings: const NoiseSettings(octaves: 32),
//           seed: seed,
//         ),
//         _moistureNoise = Noise(
//           settings: const NoiseSettings(octaves: 32),
//           seed: seed,
//         );

//   final double density;

//   final Noise _heightMapNoise;
//   final Noise _moistureNoise;

//   final Vector2 _size;

//   double _moisture(int x, int y) {
//     final noise = _moistureNoise.getSum(x.toDouble(), y.toDouble());
//     return noise / 2 + 0.5; // Rescale from -1.0:+1.0 to 0.0:1.0
//   }

//   double _height(int x, int y) {
//     final noise = _heightMapNoise.getSum(x.toDouble(), y.toDouble());
//     return noise / 2 + 0.5; // Rescale from -1.0:+1.0 to 0.0:1.0
//   }

//   /// Generates a value from a square gradient.
//   double _gradient(int x, int y) {
//     final xValue = (x * 2 - _size.x).abs() / _size.x;
//     final yValue = (y * 2 - _size.y).abs() / _size.y;
//     return max(xValue, yValue) - density;
//   }

//   Color getCell(int x, int y) {
//     final elevation = (_height(x, y) - _gradient(x, y)).clamp(0.0, 1.0);
//     final moisture = _moisture(x, y);

//     return _getColor(elevation, moisture);
//   }

//   Color _getColor(double elevation, double moisture) {
//     const deepOcean = Color(0xFF003eb2);
//     const ocean = Color(0xFF0952c6);
//     const beach = Color(0xFFa49463);
//     const dune = Color(0xFF807441);
//     const forest = Color(0xFF3c6114);
//     const snow = Color(0xFFFFFFFF);
//     const grassLand = Color(0xFF4CAF50);

//     if (elevation > 0.8) {
//       return snow;
//     } else if (elevation > 0.7) {
//       return const Color(0xFF9E9E9E);
//     } else if (elevation > 0.65) {
//       return const Color(0xFF616161);
//     } else if (elevation > 0.3) {
//       if (moisture > 0.6) {
//         return forest;
//       }
//       return grassLand;
//     } else if (elevation > 0.25) {
//       return dune;
//     } else if (elevation > 0.2) {
//       return beach;
//     } else if (elevation > 0.1) {
//       return ocean;
//     }
//     return deepOcean;
//   }
// } 
