import 'package:chat_nest/authentication/auth_service.dart';
import 'package:chat_nest/components/drawer.dart';
import 'package:chat_nest/components/user_tile.dart';
import 'package:chat_nest/pages/chat_page.dart';
import 'package:flutter/material.dart';
import 'package:chat_nest/chat/chat_service.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  //chat & auth services
  final ChatService _chatService = ChatService();
  final AuthService _authService = AuthService();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomePage'),
        // backgroundColor: Colors.transparent,
        // foregroundColor: Colors.grey,
        // elevation: 0,
      ),
      drawer: const MyDrawer(),
      body: _buildUserList(),
    );
  }

  //build a list of users except for the current logged in user
Widget _buildUserList() {
    return StreamBuilder(
        stream: _chatService.getUsersStream(),
        builder: (context, snapshot){
          //error
          if (snapshot.hasError){
            return const Text('Error');
          }

          //loading...
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text('Loading...');
          }

          //return listview
          return ListView(
            children: snapshot.data!.map<Widget>((userData) => _buildUserListItem(userData, context)).toList(),
          );
        });
}

//build individual user list item
Widget _buildUserListItem(Map<String, dynamic> userData, BuildContext context) {
    //display all users except current user
  return UserTile(
    text: userData['email'],
    onTap: () {
      //tapped on a user to go to the chat page
      Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ChatPage(
            receiverEmail: userData["email"],
            receiverID: userData['uid'],
          ),
          ));
    },
  );
}

}
