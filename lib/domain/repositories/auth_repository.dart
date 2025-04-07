import 'package:auth/domain/entities/user_entity.dart';

abstract class AuthRepository {
  Future<UserEntity> signUpWithEmail(
    String name,
    String email,
    String password,
  );
  Future<UserEntity> signInWithEmail(String email, String password);
  Future<UserEntity?> getCurrentUser();
  Future<void> signOut();
  Future<UserEntity> signInWithGoogle();
  Future<UserEntity> signInWithFacebook();
}
