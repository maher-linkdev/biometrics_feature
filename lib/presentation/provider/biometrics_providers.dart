import 'package:biometrics_feature/domain/entity/biometric_status.dart';
import 'package:biometrics_feature/domain/repository/biometric_repository.dart';
import 'package:biometrics_feature/domain/usecase/authenticate_biometrics_usecase.dart';
import 'package:biometrics_feature/domain/usecase/check_biometric_status_use_case.dart';
import 'package:biometrics_feature/infrastructure/repository/biometric_repository_impl.dart';
import 'package:biometrics_feature/presentation/provider/biometrics_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final biometricRepositoryProvider = Provider<BiometricRepository>((ref) {
  return BiometricRepositoryImpl();
});

final checkBiometricStatusUseCaseProvider = Provider<CheckBiometricStatusUseCase>((ref) {
  final repository = ref.watch(biometricRepositoryProvider);
  return CheckBiometricStatusUseCase(repository);
});

final authenticateBiometricUseCaseProvider = Provider<AuthenticateBiometricUseCase>((ref) {
  final repository = ref.watch(biometricRepositoryProvider);
  return AuthenticateBiometricUseCase(repository);
});



final biometricsProvider = StateNotifierProvider<BiometricsNotifier, BiometricStatus>((ref) {
  final authenticateUsecase = ref.read(authenticateBiometricUseCaseProvider);
  final checkBiometricsUsecase = ref.read(checkBiometricStatusUseCaseProvider);

  return BiometricsNotifier(
authenticateUsecase,
      checkBiometricsUsecase
  );
});
