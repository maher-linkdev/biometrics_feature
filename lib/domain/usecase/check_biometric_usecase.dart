import 'package:biometrics_feature/domain/repository/biometric_repository.dart';

class CheckBiometricsUseCase {
  final BiometricRepository _repository;

  CheckBiometricsUseCase(this._repository);

  Future<bool> call() async {
    return await _repository.canCheckBiometrics();
  }
}