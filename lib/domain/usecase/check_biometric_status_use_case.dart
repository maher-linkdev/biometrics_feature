import 'package:biometrics_feature/domain/entity/biometric_status.dart';
import 'package:biometrics_feature/domain/repository/biometric_repository.dart';

class CheckBiometricStatusUseCase {
  final BiometricRepository _repository;

  CheckBiometricStatusUseCase(this._repository);

  Future<BiometricStatus> call() async {
    return await _repository.checkBiometricStatus();
  }
} 