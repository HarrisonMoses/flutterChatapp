import 'package:chatapp/services/Auth/Auth_gate.dart';
import 'package:chatapp/firebase_options.dart';
// import 'package:chatapp/Auth/Login_Register.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:chatapp/themes/light_theme.dart';
import 'package:flutter/material.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform,);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: lightmode,
      home:const AuthGate(),
    );
  }
}


 