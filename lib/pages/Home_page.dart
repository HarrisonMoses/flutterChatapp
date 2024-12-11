// import 'package:chatapp/Auth/Authservice.dart';
import 'package:chatapp/components/My_drawer.dart';
import 'package:chatapp/components/user_tile.dart';
import 'package:chatapp/pages/Chat_page.dart';
import 'package:chatapp/services/Auth/Authservice.dart';
import 'package:chatapp/services/Chat/chat-service.dart';
import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  Homepage({super.key});

  final AuthService _auth = AuthService();
  final chatservice _chat = chatservice();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: const EdgeInsets.only(top: 45),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          title: const Center(child: Text("Home")),
        ),
        drawer: const MyDrawer(),
        body: _buildUserList(),
      ),
    );
  }

  Widget _buildUserList() {
    return StreamBuilder(
        stream: _chat.getUserStream(),
        builder: (context, snapshot) {
          //error
          if (snapshot.hasError) {
            return const Center(child: Text("Something went wrong"));
          }
          //loading
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          //data
          return ListView(
            children: snapshot.data!.map<Widget>((user) {
              return UserTile(
                text: user['email'],
                onTap: () {
                  //navigate to chat screen
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Chatpage(
                        recieverEmail: user['email'],
                      ),
                    ),
                  );
                },
              );
            }).toList(),
          );
        });
  }
}
