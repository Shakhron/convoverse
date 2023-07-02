import 'dart:async';

import 'package:firebase/core/di/init_di.dart';
import 'package:firebase/features/auth/domain/entities/auth_user.dart';
import 'package:firebase/features/auth/domain/repository/auth_repository.dart';

class CurrentUserUseCase {
  final AuthRepository repo = locator.get<AuthRepository>();

  CurrentUserUseCase();

  Stream<AuthUser> call() {
    try {
      return repo.currentUser();
    } catch (e) {
      rethrow;
    }
  }
}
