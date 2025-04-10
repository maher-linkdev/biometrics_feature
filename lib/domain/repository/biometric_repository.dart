
import 'package:biometrics_feature/domain/entity/biometric_status.dart';
import 'package:local_auth/local_auth.dart';

abstract class BiometricRepository {
  Future<bool> authenticate();
  Future<bool> isDeviceSupportBiometrics();
  Future<bool> canCheckBiometrics();
  Future<List<AppBiometricType>> getAvailableBiometrics();
}


