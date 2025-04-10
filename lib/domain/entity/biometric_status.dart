class BiometricStatus {
  final bool isAvailable;
  final bool isEnabled;
  final List<AppBiometricType> availableTypes;

  const BiometricStatus({
    required this.isAvailable,
    required this.isEnabled,
    required this.availableTypes,
  });
}

enum AppBiometricType {
  fingerprint,
  face,
  iris,
  strong,
  weak
} 