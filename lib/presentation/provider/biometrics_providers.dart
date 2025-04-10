import 'package:biometrics_feature/domain/entity/biometric_status.dart';
import 'package:biometrics_feature/domain/repository/biometric_repository.dart';
import 'package:biometrics_feature/domain/usecase/authenticate_biometrics_usecase.dart';
import 'package:biometrics_feature/domain/usecase/check_biometric_usecase.dart';
import 'package:biometrics_feature/domain/usecase/check_device_support_biometrics_usecase.dart';
import 'package:biometrics_feature/domain/usecase/get_available_biometrics_usecase.dart';
import 'package:biometrics_feature/infrastructure/repository/biometric_repository_impl.dart';
import 'package:biometrics_feature/presentation/provider/biometrics_notifier.dart';
import 'package:biometrics_feature/service/biometrics_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final biometricsServiceProvider = Provider<BiometricsService>((ref) {
  return BiometricsService();
});

final biometricRepositoryProvider = Provider<BiometricRepository>((ref) {
  final biometricsService = ref.watch(biometricsServiceProvider);
  return BiometricRepositoryImpl(biometricsService);
});

final checkBiometricStatusUseCaseProvider = Provider<CheckBiometricsUseCase>((ref) {
  final repository = ref.watch(biometricRepositoryProvider);
  return CheckBiometricsUseCase(repository);
});

final checkDeviceSupportBiometricsUseCaseProvider = Provider<CheckDeviceSupportBiometricsUseCase>((ref) {
  final repository = ref.watch(biometricRepositoryProvider);
  return CheckDeviceSupportBiometricsUseCase(repository);
});


final availableBiometricUseCaseProvider = Provider<GetAvailableBiometricsUseCase>((ref) {
  final repository = ref.watch(biometricRepositoryProvider);
  return GetAvailableBiometricsUseCase(repository);
});

final authenticateBiometricUseCaseProvider = Provider<AuthenticateBiometricUseCase>((ref) {
  final repository = ref.watch(biometricRepositoryProvider);
  return AuthenticateBiometricUseCase(repository);
});





final biometricsProvider = StateNotifierProvider<BiometricsStateNotifier, BiometricStatus>((ref) {
  final authenticateUsecase = ref.read(authenticateBiometricUseCaseProvider);
  final checkBiometricsUsecase = ref.read(checkBiometricStatusUseCaseProvider);
  final checkDeviceSupportBiometricsUsecase = ref.read(checkDeviceSupportBiometricsUseCaseProvider);
  final avaiableBiometricsUsecase = ref.read(availableBiometricUseCaseProvider);

  return BiometricsStateNotifier(
authenticateUsecase,
      checkBiometricsUsecase,
      checkDeviceSupportBiometricsUsecase,
      avaiableBiometricsUsecase
  );
});
