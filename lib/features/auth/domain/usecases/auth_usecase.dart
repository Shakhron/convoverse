abstract class AuthUseCase {
  Future signInWithGoogle();

  Future signInWithApple();

  Future signOut();

  getUser();
}
