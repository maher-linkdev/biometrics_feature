import 'package:biometrics_feature/domain/entity/biometric_status.dart';
import 'package:biometrics_feature/domain/repository/biometric_repository.dart';

class GetAvailableBiometricsUseCase {
  final BiometricRepository _repository;

  GetAvailableBiometricsUseCase(this._repository);

  Future<List<AppBiometricType>> call() async {
    return await _repository.getAvailableBiometrics();
  }
}