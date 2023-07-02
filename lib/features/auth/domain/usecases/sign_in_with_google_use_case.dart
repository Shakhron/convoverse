import '../../../../core/di/init_di.dart';
import '../repository/auth_repository.dart';

class SignInWithGoogleUseCase {
  final AuthRepository repo = locator.get<AuthRepository>();

  SignInWithGoogleUseCase();

  Future<void> call() async {
    try {
      repo.signInWithGoogle();
    } catch (e) {
      rethrow;
    }
  }
}
