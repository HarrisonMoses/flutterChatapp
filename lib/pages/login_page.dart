import 'package:chatapp/components/Button_compo.dart';
import 'package:chatapp/components/textfield_compo.dart';
import 'package:chatapp/Auth/Authservice.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {

  // Email and  password controller
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final void Function()? onTap;
  LoginPage({super.key, required this.onTap});

  //Login function
  void login (BuildContext context )async { 
    final authService = AuthService();

    try{
      await authService.signInWithEmailPassword(_emailController.text, _passwordController.text);
    }catch(e){
      showDialog(context: context, builder: (context)=>AlertDialog(
        title: Text(e.toString()),
      ),);
    }

  } 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          // logo
            Icon(Icons.message,
              size: 60,
              color: Theme.of(context).colorScheme.primary,
            ),
            const SizedBox(height: 20),
            
          // welcome back message
        Text("Welcome Back you been missed.",
        style: TextStyle(
            color: Theme.of(context).colorScheme.primary,
            fontSize: 16,
        )),
        const SizedBox(height: 20),

          // email textfield
        Textfield(
          hintText: "Email",
          controller: _emailController,
        ),
        const SizedBox(height: 20),

          // password textfield
         Textfield(
                hintText: "Password",
                controller: _passwordController,
              ),
              const SizedBox(height: 20),

          // login button
         Buttomcompo(
          text: "Login",
          onTap: ()=>login(context),
         ),
          const SizedBox(height: 20),

          // register now
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Have no account?",
          style:TextStyle(
            color: Theme.of(context).colorScheme.primary,
          ),
          ),
          GestureDetector(
            onTap:onTap,
            child: Text(
              "Register Now",
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.bold,
              ),
             
            ),
          ),
        ],    
          )
          ],
        ),
      )
    );
  }
}