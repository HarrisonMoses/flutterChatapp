import 'package:chatapp/Auth/Authservice.dart';
import 'package:chatapp/components/Button_compo.dart';
import 'package:chatapp/components/textfield_compo.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  // Email and  password controller
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _comfirmController = TextEditingController();
  final void Function()? onTap;
  RegisterPage({
    super.key,
    required this.onTap
  });

  //Login function
  void register( BuildContext context) {
    //register function
    final auth = AuthService();
if(_passwordController.text == _comfirmController.text){
  try{
    auth.signUpWithEmailPassword(_emailController.text, _passwordController.text,);

  }catch(e){
     showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(e.toString()),
          ),
        );
  }

}else{
      showDialog(
        context: context,
        builder: (context) => const AlertDialog(
          title:  Text("Password does not match"),
        ),
      );
}


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // logo
              Icon(
                Icons.message,
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
              // comfirm password textfield
              Textfield(
                hintText: "Comfirm Password",
                controller: _comfirmController,
              ),
              const SizedBox(height: 20),

              // login button
              Buttomcompo(
                text: "Rerister",
                onTap: ()=>register(context),
              ),
              const SizedBox(height: 20),

              // register now
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Have an account?",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  GestureDetector(
                    onTap:onTap,
                    child: Text(
                      "Login Now",
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
        ));
  }
}
