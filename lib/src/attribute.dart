import 'package:noise_map_poc/src/values/value.dart';

/// {@template attribute}
/// An attribute that provides values for a cell.
/// {@endtemplate}
abstract class Attribute {
  /// {@macro attribute}
  const Attribute({required this.name, required this.value});

  /// The name of the attribute.
  final String name;

  /// The value generator of the attribute.
  final Value value;
}
