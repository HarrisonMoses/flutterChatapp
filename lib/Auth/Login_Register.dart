import 'package:chatapp/pages/login_page.dart';
import 'package:chatapp/pages/register_page.dart';
import 'package:flutter/material.dart';

class LoginOrRegister extends StatefulWidget {

  const LoginOrRegister({super.key, });

  @override
  State<LoginOrRegister> createState() => _LoginOrRegisterState();
}

class _LoginOrRegisterState extends State<LoginOrRegister> {
   bool showLoginPage = true;

// toggle login pages
void toggle(){
  setState((){
  showLoginPage = !showLoginPage;
  });
}

  @override
  Widget build(BuildContext context) {
    if(showLoginPage){
      return LoginPage(
        onTap: toggle,
      );
    }else{
      return RegisterPage(
        onTap: toggle,
      );
    }
  }
}