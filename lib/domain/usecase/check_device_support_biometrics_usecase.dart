import 'package:biometrics_feature/domain/repository/biometric_repository.dart';

class CheckDeviceSupportBiometricsUseCase {
  final BiometricRepository _repository;

  CheckDeviceSupportBiometricsUseCase(this._repository);

  Future<bool> call() async {
    return await _repository.isDeviceSupportBiometrics();
  }
}