
import 'package:biometrics_feature/domain/entity/biometric_status.dart';

abstract class BiometricRepository {
  Future<BiometricStatus> checkBiometricStatus();
  Future<bool> authenticate();
  Future<bool> isBiometricAvailable();
} 