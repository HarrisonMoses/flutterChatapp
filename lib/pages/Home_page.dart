import 'package:chatapp/Auth/Authservice.dart';
import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});
  void logout(){
    //logout function
    final auth = AuthService();
    auth.signOut();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: const EdgeInsets.only(top: 45),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          title: const Center(child:  Text("Home")),
          actions: [
            IconButton(onPressed: logout, icon: const Icon(Icons.logout))
          ],
        )
          
        ),
    );
  }
}
