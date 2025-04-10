import 'package:biometrics_feature/service/biometrics_service.dart';
import 'package:local_auth/local_auth.dart';
import 'package:biometrics_feature/domain/entity/biometric_status.dart';
import 'package:biometrics_feature/domain/repository/biometric_repository.dart';

class BiometricRepositoryImpl implements BiometricRepository {
final BiometricsService biometricsService;
BiometricRepositoryImpl(this.biometricsService);

  @override
  Future<bool> authenticate() async {

      return await biometricsService.authenticate();
  }



  @override
  Future<bool> canCheckBiometrics() async{
    return await biometricsService.canCheckBiometrics();

  }

  @override
  Future<bool> isDeviceSupportBiometrics() async{
    return await biometricsService.isDeviceSupportBiometrics();

  }

  @override
  Future<List<AppBiometricType>> getAvailableBiometrics() async{
    final availableBiometrics =  await biometricsService.availableBiometrics();
    return availableBiometrics.map((type) {
      switch (type) {
        case BiometricType.fingerprint:
          return AppBiometricType.fingerprint;
        case BiometricType.face:
          return AppBiometricType.face;
        case BiometricType.iris:
          return AppBiometricType.iris;
        case BiometricType.strong:
          return AppBiometricType.strong;
        default:
          return AppBiometricType.weak;
      }
    }).toList();

  }
} 