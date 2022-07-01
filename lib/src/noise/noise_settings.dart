/// {@template noise_settings}
/// Setting used for noise generation.
/// {@endtemplate}
class NoiseSettings {
  /// {@macro noise_settings}
  const NoiseSettings({
    this.octaves = 3,
    this.startFrequency = 0.01,
    this.persistance = 0.5,
  })  : assert(
          startFrequency > 0.001,
          'startFrequency must be greater than 0.001',
        ),
        assert(persistance > 0, 'persistance must be greater than 0');

  /// The number of octaves to use.
  final int octaves;

  /// The starting frequency of the noise.
  final double startFrequency;

  /// The persistance of the noise.
  final double persistance;
}
