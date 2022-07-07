/// {@template range}
/// Describe a range between two values.
/// {@endtemplate}
class Range {
  /// {@macro range}
  const Range({this.min = 0.0, this.max = 1.0})
      : assert(min <= max, 'min must be less than or equal to max'),
        assert(min >= 0.0, 'min must be greater than or equal to 0.0'),
        assert(max > 0.0, 'max must be greater than 0.0'),
        assert(min < 1.0, 'min must be less than 1.0'),
        assert(max <= 1.0, 'max must be less than or equal to 1.0');

  /// The minimum value of the range.
  final double min;

  /// The maximum value of the range.
  final double max;

  /// Returns whether the given value is in the range.
  bool contains(double value) => value >= min && value <= max;
}
