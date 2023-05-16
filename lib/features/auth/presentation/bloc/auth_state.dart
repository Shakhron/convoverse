part of 'auth_bloc.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.loading() = _Loading;
  const factory AuthState.unauthorized() = _Unauthorized;
  const factory AuthState.authorized() = _Authorized;
}
