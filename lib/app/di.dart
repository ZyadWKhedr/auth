import 'package:auth/features/ai_chat/data/datasources/gemini_datasource.dart';
import 'package:auth/features/ai_chat/data/repositories/chat_repo_impl.dart';
import 'package:auth/features/ai_chat/domain/repositories/chat_repository.dart';
import 'package:auth/features/auth/data/repositories/auth_repo_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../features/auth/domain/repositories/auth_repository.dart';

final supabaseProvider = Provider((ref) => Supabase.instance.client);

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepoImpl(ref.watch(supabaseProvider));

  final geminiDatasourceProvider = Provider((ref) => GeminiDataSource());

  final chatRepositoryProvider = Provider<ChatRepository>(
    (ref) => ChatRepositoryImpl(ref.read(geminiDatasourceProvider)),
  );
  
});
