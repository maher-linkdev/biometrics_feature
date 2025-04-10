import 'package:local_auth/local_auth.dart';

class BiometricsService{
  final LocalAuthentication _localAuth = LocalAuthentication();

  Future<bool> canCheckBiometrics() async=>await _localAuth.canCheckBiometrics;
  Future<bool>  isDeviceSupportBiometrics() async=> await _localAuth.isDeviceSupported();
  Future<List<BiometricType>>  availableBiometrics ()async=> await _localAuth.getAvailableBiometrics();
  Future<bool> authenticate()=>_localAuth.authenticate(
  localizedReason: 'Please authenticate to continue',
  options: const AuthenticationOptions(
  stickyAuth: true,
  biometricOnly: true,
  ),
  );
}