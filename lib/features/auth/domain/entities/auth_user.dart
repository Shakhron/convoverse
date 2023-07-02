import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'auth_user.freezed.dart';

@freezed
@injectable
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
