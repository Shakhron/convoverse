import 'dart:async';

import 'package:firebase/features/auth/domain/entities/auth_user.dart';
import 'package:firebase/features/auth/domain/repository/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';

import '../models/auth_user_model.dart';

@Singleton(as: AuthRepository)
class AuthRepositoryImpl extends AuthRepository {
  final _firebaseAuth = FirebaseAuth.instance;

  @override
  User? getUser() {
    return _firebaseAuth.currentUser;
  }

  @override
  Stream<AuthUser> currentUser() {
    try {
      StreamController<AuthUser> streamController =
          StreamController<AuthUser>();
      FirebaseAuth.instance.authStateChanges().listen((event) {
        streamController
            .add(AuthUserModel.fromFirebaseAuthUser(event!).toEntity());
      });
      return streamController.stream;
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<void> signInWithApple() async {
    final appleProvider = AppleAuthProvider();
    try {
      if (kIsWeb) {
        await FirebaseAuth.instance.signInWithPopup(appleProvider);
      } else {
        await FirebaseAuth.instance.signInWithProvider(appleProvider);
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<void> signInWithGoogle() async {
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
      throw Exception(e);
    }
  }

  @override
  Future<void> signOut() async {
    try {
      await _firebaseAuth.signOut();
    } catch (e) {
      throw Exception(e);
    }
  }
}
