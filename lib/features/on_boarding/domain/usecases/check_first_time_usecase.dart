import 'package:auth/core/services/shared_prefrences_service.dart';

class CheckFirstTimeUseCase {
  final PreferencesService preferencesService;

  CheckFirstTimeUseCase(this.preferencesService);

  Future<bool> call() {
    return preferencesService.isFirstTimeUser();
  }
}
