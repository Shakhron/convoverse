import 'dart:developer';

import 'package:firebase/features/auth/domain/repository/auth_repository.dart';
import 'package:firebase/features/auth/domain/usecases/sign_in_with_apple_use_case.dart';
import 'package:firebase/features/auth/domain/usecases/sign_in_with_google_use_case.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';
part 'auth_bloc.freezed.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(const AuthState.unauthorized()) {
    on<_SignInWithApple>((event, emit) async {
      try {
        await SignInWithAppleUseCase().call();
      } catch (e) {
        log(e.toString());
      }
    });
    on<_SignInWithGoogle>((event, emit) async {
      try {
        await SignInWithGoogleUseCase().call();
      } catch (e) {
        log(e.toString());
      }
    });
  }
}
