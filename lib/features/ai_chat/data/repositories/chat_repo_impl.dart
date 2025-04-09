import 'package:auth/features/ai_chat/data/datasources/gemini_datasource.dart';
import 'package:auth/features/ai_chat/domain/repositories/chat_repository.dart';

class ChatRepositoryImpl implements ChatRepository {
  final GeminiDataSource _dataSource;

  // Simplified prompt for more natural responses
  static const String _medicalPrompt = """
  You are a health assistant. Answer health-related questions briefly and kindly. Provide general advice for common symptoms or health issues. If the user needs more help, suggest consulting a doctor.
  Message: {message}
  """;

  ChatRepositoryImpl(this._dataSource);

  @override
  Future<String> sendMedicalMessage(String message) async {
    // Handle greetings first
    if (_isGreeting(message)) {
      return _greetingResponse();
    }

    // Check if the message is about health or medical topics
    if (!_hasMedicalKeywords(message) && !await _isMedicalIntent(message)) {
      return 'I can only help with health-related topics like symptoms, treatments, or medications. Ask me anything health-related!';
    }

    // Return a quick, personal assistant-style response
    String response = await _dataSource.sendMessage(message);

    // Shorten the response if needed and encourage asking for more details
    return _shortenResponse(response);
  }

  // Greeting detection
  bool _isGreeting(String message) {
    final greetings = [
      'hello',
      'hi',
      'hey',
      'good morning',
      'good afternoon',
      'good evening',
      'how are you',
      'what\'s up',
    ];
    final lowerMessage = message.toLowerCase();
    return greetings.any((greeting) => lowerMessage.contains(greeting));
  }

  // Response to a greeting
  String _greetingResponse() {
    return 'Hey there! How can I assist you with your health or medication questions today?';
  }

  // Shorten responses to keep them concise
  String _shortenResponse(String response) {
    if (response.length > 100) {
      return '${response.substring(0, 100)}... Want to know more? Ask me for more details!';
    }
    return response;
  }

  // Fast check for common medical terms
  bool _hasMedicalKeywords(String message) {
    final keywords = [
      'headache',
      'fever',
      'pain',
      'medicine',
      'doctor',
      'treatment',
      'symptom',
      'cold',
      'sick',
      'diagnosis',
      'medication',
      'prescription',
      'illness',
      'health',
      'flu',
      'vaccine',
      'cough',
      'treatment',
      'therapy',
    ];
    final lowerMessage = message.toLowerCase();
    return keywords.any((word) => lowerMessage.contains(word));
  }

  // AI-based check to detect medical intent
  Future<bool> _isMedicalIntent(String message) async {
    final prompt = _medicalPrompt.replaceFirst('{message}', message);
    final response = await _dataSource.sendMessage(prompt);
    return response.trim().toLowerCase() == 'true';
  }
}
