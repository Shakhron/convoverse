import 'package:firebase/features/auth/domain/usecases/auth_usecase.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: AuthUseCase)
class AuthRepository extends AuthUseCase {
  final _firebaseAuth = FirebaseAuth.instance;

  @override
  User? getUser() {
    if (_firebaseAuth.currentUser != null) {
      return _firebaseAuth.currentUser;
    }
  }

  @override
  Future signInWithApple() async {
    final appleProvider = AppleAuthProvider();
    if (kIsWeb) {
      await FirebaseAuth.instance.signInWithPopup(appleProvider);
    } else {
      await FirebaseAuth.instance.signInWithProvider(appleProvider);
    }
  }

  @override
  Future signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      await FirebaseAuth.instance.signInWithCredential(credential);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future signOut() async {
    try {
      await _firebaseAuth.signOut();
    } catch (e) {
      throw Exception(e);
    }
  }
}
