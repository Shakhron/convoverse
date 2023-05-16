import 'package:firebase/core/di/init_di.dart';
import 'package:firebase/myapp.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

@override
Future<void> preloadData() async {
  initDi();
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await preloadData();
  runApp(const MyApp());
}
