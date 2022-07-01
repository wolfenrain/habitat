/// {@template range}
/// Describe a range between two values.
/// {@endtemplate}
class Range {
  /// {@macro range}
  const Range({this.min = 0.0, this.max = 1.0});

  /// The minimum value of the range.
  final double min;

  /// The maximum value of the range.
  final double max;

  /// Returns whether the given value is in the range.
  bool contains(double value) => value >= min && value <= max;
}
