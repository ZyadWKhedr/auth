import 'package:auth/core/services/shared_prefrences_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/usecases/check_first_time_usecase.dart';

final preferencesServiceProvider = Provider((ref) => PreferencesService());
final checkFirstTimeUseCaseProvider = Provider((ref) => 
  CheckFirstTimeUseCase(ref.read(preferencesServiceProvider))
);

final isFirstTimeProvider = FutureProvider<bool>((ref) async {
  final usecase = ref.read(checkFirstTimeUseCaseProvider);
  return usecase();
});
