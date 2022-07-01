import 'package:noise_map_poc/src/values/value.dart';

/// {@template attribute}
/// An attribute that provides values for a cell.
/// {@endtemplate}
abstract class Attribute {
  /// {@macro attribute}
  const Attribute({required this.name, required this.value});

  final String name;

  final Value value;
}
