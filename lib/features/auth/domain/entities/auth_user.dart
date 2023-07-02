import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_user.freezed.dart';

@freezed
class AuthUser with _$AuthUser {
  const factory AuthUser({
    required String? uid,
    required String? name,
    required String? avatarURL,
    required String? email,
  }) = _AuthUser;

  static const AuthUser empty = AuthUser(
    uid: '',
    name: '',
    avatarURL: '',
    email: '',
  );
}
