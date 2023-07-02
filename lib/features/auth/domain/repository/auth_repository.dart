import '../entities/auth_user.dart';

abstract class AuthRepository {
  Stream<AuthUser> currentUser();
  Future<void> signInWithApple();
  Future<void> signInWithGoogle();
  Future<void> signOut();
}
