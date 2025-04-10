import 'package:biometrics_feature/domain/repository/biometric_repository.dart';

class AuthenticateBiometricUseCase {
  final BiometricRepository _repository;

  AuthenticateBiometricUseCase(this._repository);

  Future<bool> call() async {
    return await _repository.authenticate();
  }
}