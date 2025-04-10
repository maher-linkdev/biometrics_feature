



import 'package:biometrics_feature/domain/entity/biometric_status.dart';
import 'package:biometrics_feature/domain/usecase/authenticate_biometrics_usecase.dart';
import 'package:biometrics_feature/domain/usecase/check_biometric_status_use_case.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BiometricsNotifier extends StateNotifier<BiometricStatus> {
  final AuthenticateBiometricUseCase authenticateBiometricUseCase;
  final CheckBiometricStatusUseCase checkBiometricStatusUseCase;
  BiometricsNotifier(this.authenticateBiometricUseCase,this.checkBiometricStatusUseCase) : super(BiometricStatus(isAvailable: false, isEnabled: false, availableTypes: [])){
    checkBiometrics();
  }



  Future<void> checkBiometrics()async {
    final checkBiometricsStatus = await checkBiometricStatusUseCase();
    state = checkBiometricsStatus;
  }


  Future<void> authenticate(BuildContext context)async {
    final isAuthenticated = await authenticateBiometricUseCase();
    if (isAuthenticated) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Authentication successful!')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Authentication failed!')),
      );
    }
  }
}
