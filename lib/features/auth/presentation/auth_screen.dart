import 'package:firebase/core/widgets/loading_widget.dart';
import 'package:firebase/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:firebase/features/auth/presentation/widgets/unauthorized_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        return Scaffold(
          body: state.when(
            loading: () => const LoadingWidget(),
            unauthorized: () => const UnauthorizedWidget(),
            authorized: () => Container(),
          ),
        );
      },
    );
  }
}
