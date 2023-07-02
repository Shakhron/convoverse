import 'package:firebase/features/auth/domain/repository/auth_repository.dart';

import '../../../../core/di/init_di.dart';

class SignOutUseCase {
  final AuthRepository repo = locator.get<AuthRepository>();

  SignOutUseCase();

  Future<void> call() async {
    try {
      repo.signOut();
    } catch (e) {
      rethrow;
    }
  }
}
