import 'package:firebase/core/di/init_di.dart';
import 'package:firebase/core/theme/theme.dart';
import 'package:firebase/features/auth/domain/usecases/auth_usecase.dart';
import 'package:firebase/features/auth/presentation/auth_screen.dart';
import 'package:firebase/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:firebase/features/home/domain/useCases/home_usecase.dart';
import 'package:firebase/features/home/presentation/bloc/home_bloc.dart';
import 'package:firebase/features/home/presentation/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: buildLightTheme(),
        darkTheme: buildDarkTheme(),
        themeMode: ThemeMode.system,
        home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return BlocProvider(
                create: (context) => HomeBloc(
                    uid: FirebaseAuth.instance.currentUser!.uid,
                    repo: locator.get<HomeUseCase>()),
                child: const HomeScreen(),
              );
            }

            return BlocProvider(
              create: (context) =>
                  AuthBloc(authRepo: locator.get<AuthUseCase>()),
              child: const AuthScreen(),
            );
          },
        ));
  }
}
