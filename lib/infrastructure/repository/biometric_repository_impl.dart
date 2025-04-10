import 'package:local_auth/local_auth.dart';
import 'package:biometrics_feature/domain/entity/biometric_status.dart';
import 'package:biometrics_feature/domain/repository/biometric_repository.dart';

class BiometricRepositoryImpl implements BiometricRepository {
  final LocalAuthentication _localAuth = LocalAuthentication();

  @override
  Future<BiometricStatus> checkBiometricStatus() async {
    final canCheckBiometrics = await _localAuth.canCheckBiometrics;
    final isDeviceSupported = await _localAuth.isDeviceSupported();
    final availableBiometrics = await _localAuth.getAvailableBiometrics();

    return BiometricStatus(
      isAvailable: isDeviceSupported,
      isEnabled: canCheckBiometrics,
      availableTypes: availableBiometrics.map((type) {
        switch (type) {
          case BiometricType.fingerprint:
            return AppBiometricType.fingerprint;
          case BiometricType.face:
            return AppBiometricType.face;
          case BiometricType.iris:
            return AppBiometricType.iris;
          default:
            return AppBiometricType.fingerprint;
        }
      }).toList(),
    );
  }

  @override
  Future<bool> authenticate() async {

      return await _localAuth.authenticate(
        localizedReason: 'Please authenticate to continue',
        options: const AuthenticationOptions(
          stickyAuth: true,
          biometricOnly: true,
        ),
      );
  }

  @override
  Future<bool> isBiometricAvailable() async {
    return await _localAuth.isDeviceSupported();
  }
} 