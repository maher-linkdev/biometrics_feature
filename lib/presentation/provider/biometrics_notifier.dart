import 'package:biometrics_feature/domain/entity/biometric_status.dart';
import 'package:biometrics_feature/domain/usecase/authenticate_biometrics_usecase.dart';
import 'package:biometrics_feature/domain/usecase/check_biometric_usecase.dart';
import 'package:biometrics_feature/domain/usecase/check_device_support_biometrics_usecase.dart';
import 'package:biometrics_feature/domain/usecase/get_available_biometrics_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BiometricsStateNotifier extends StateNotifier<BiometricStatus> {
  final AuthenticateBiometricUseCase authenticateBiometricUseCase;
  final CheckBiometricsUseCase checkBiometricUseCase;
  final CheckDeviceSupportBiometricsUseCase checkDeviceSupportBiometricsUseCase;
  final GetAvailableBiometricsUseCase getAvailableBiometricsUseCase;

  BiometricsStateNotifier(
    this.authenticateBiometricUseCase,
    this.checkBiometricUseCase,
    this.checkDeviceSupportBiometricsUseCase,
    this.getAvailableBiometricsUseCase,
  ) : super(BiometricStatus(isAvailable: false, isEnabled: false, availableTypes: [])) {
    init();
  }

  init() async {
    final hasBiometrics = await checkHasBiometrics();
    final deviceSupportsBiometrics = await checkIsDeviceSupportBiometrics();
    final availableBiometrics = await getAvailableBiometrics();

    state = BiometricStatus(
      isAvailable: deviceSupportsBiometrics,
      isEnabled: hasBiometrics,
      availableTypes: availableBiometrics,
    );
  }

  Future<bool> checkHasBiometrics() async {
    return await checkBiometricUseCase();
  }

  Future<bool> checkIsDeviceSupportBiometrics() async {
    return await checkDeviceSupportBiometricsUseCase();
  }

  Future<List<AppBiometricType>> getAvailableBiometrics() async {
    return await getAvailableBiometricsUseCase();
  }

  Future<void> authenticate(BuildContext context) async {
    final isAuthenticated = await authenticateBiometricUseCase();
    if (isAuthenticated) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Authentication successful!')));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Authentication failed!')));
    }
  }
}
