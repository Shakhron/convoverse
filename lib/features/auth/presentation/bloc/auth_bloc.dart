import 'package:firebase/features/auth/domain/usecases/auth_usecase.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';
part 'auth_bloc.freezed.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthUseCase authRepo;
  AuthBloc({required this.authRepo}) : super(const AuthState.unauthorized()) {
    on<AuthEvent>((event, emit) {});
    on<_SignInWithApple>((event, emit) async {
      try {
        await authRepo.signInWithApple();
      } catch (e) {
        print(e.toString());
      }
    });
    on<_SignInWithGoogle>((event, emit) async {
      try {
        await authRepo.signInWithGoogle();
      } catch (e) {
        print(e.toString());
      }
    });
  }
}
