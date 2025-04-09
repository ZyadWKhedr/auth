import 'package:auth/features/ai_chat/domain/repositories/chat_repository.dart';

class SendMedicalMessageUseCase {
  final ChatRepository repository;

  SendMedicalMessageUseCase(this.repository);

  Future<String?> execute(String message) async {
    return await repository.sendMedicalMessage(message);
  }
}
