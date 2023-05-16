import 'package:firebase/core/theme/theme.dart';
import 'package:firebase/features/auth/presentation/auth_screen.dart';
import 'package:firebase/features/auth/presentation/bloc/auth_bloc.dart';
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
      home: BlocProvider(
        create: (context) => AuthBloc(),
        child: const AuthScreen(),
      ),
    );
  }
}
