import 'package:auth/features/ai_chat/data/repositories/chat_repo_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/datasources/gemini_datasource.dart';
import '../../domain/repositories/chat_repository.dart';
import '../../domain/usecases/send_medical_message_usecase.dart';

// DataSource provider
final geminiDatasourceProvider = Provider((ref) => GeminiDataSource());

// Repository provider
final chatRepositoryProvider = Provider<ChatRepository>(
  (ref) => ChatRepositoryImpl(ref.read(geminiDatasourceProvider)),
);

// Use case provider
final sendMedicalMessageUseCaseProvider = Provider(
  (ref) => SendMedicalMessageUseCase(ref.read(chatRepositoryProvider)),
);

final chatProvider =
    StateNotifierProvider<ChatNotifier, List<Map<String, String>>>((ref) {
  final useCase = ref.read(sendMedicalMessageUseCaseProvider);
  return ChatNotifier(useCase);
});

class ChatNotifier extends StateNotifier<List<Map<String, String>>> {
  final SendMedicalMessageUseCase useCase;

  ChatNotifier(this.useCase) : super([]);

  Future<void> sendMessage(String userMessage) async {
    if (userMessage.trim().isEmpty) return;

    state = [...state, {'sender': 'user', 'message': userMessage}];

    final response = await useCase.execute(userMessage);

    state = [...state, {'sender': 'bot', 'message': response!}];
  }
}