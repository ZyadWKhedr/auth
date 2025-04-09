import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class GeminiDataSource {
  final GenerativeModel _model = GenerativeModel(
    model: 'gemini-2.0-flash',
    apiKey: dotenv.env['GEMINI_API_KEY']!,
  );

  Future<String> sendMessage(String message) async {
    final content = [Content.text(message)];
    final response = await _model.generateContent(content);
    return response.text ?? 'No response';
  }
}
