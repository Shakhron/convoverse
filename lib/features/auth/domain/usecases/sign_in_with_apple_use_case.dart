import '../../../../core/di/init_di.dart';
import '../repository/auth_repository.dart';

class SignInWithAppleUseCase {
  final AuthRepository repo = locator.get<AuthRepository>();

  SignInWithAppleUseCase();

  Future<void> call() async {
    try {
      repo.signInWithApple();
    } catch (e) {
      rethrow;
    }
  }
}
