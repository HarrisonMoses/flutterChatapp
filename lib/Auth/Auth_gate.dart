import 'package:chatapp/Auth/Login_Register.dart';
import 'package:chatapp/pages/Home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:StreamBuilder(stream: FirebaseAuth.instance.authStateChanges(), builder: (context, snapshot){
        // user logged in 
      if(snapshot.hasData){
        return const Homepage();
        }
        //user is failed to login 
        else{
          return const LoginOrRegister();
        }

      },),
    );
  }
}

