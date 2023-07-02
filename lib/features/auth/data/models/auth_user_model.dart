// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:firebase/features/auth/domain/entities/auth_user.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;

class AuthUserModel {
  final String name;
  final String avatarURL;
  final String uid;
  final String email;
  AuthUserModel({
    required this.name,
    required this.avatarURL,
    required this.uid,
    required this.email,
  });

  factory AuthUserModel.fromFirebaseAuthUser(firebase_auth.User firebaseUser) {
    return AuthUserModel(
      name: firebaseUser.displayName ?? 'No name',
      avatarURL: firebaseUser.photoURL ?? '',
      uid: firebaseUser.uid,
      email: firebaseUser.email ?? 'test@test.com',
    );
  }

  AuthUser toEntity() {
    return AuthUser(
      uid: uid,
      name: name,
      avatarURL: avatarURL,
      email: email,
    );
  }
}
