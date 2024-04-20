import 'package:chat_nest/authentication/auth_service.dart';
import 'package:chat_nest/drawer/contacts.dart';
import 'package:chat_nest/images/app_logo2.dart';
import 'package:chat_nest/pages/home_page.dart';
import 'package:chat_nest/pages/settings.dart';
import 'package:flutter/material.dart';
import 'package:chat_nest/drawer/chat_folders.dart';
import 'package:chat_nest/drawer/saved_msgs.dart';


class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  void logout() {
    // get auth service
    final auth = AuthService();
    auth.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.7, // Adjust the width as needed
      child: Drawer(
        backgroundColor: const Color(0xFF34BC45),
        //backgroundColor: Theme.of(context).colorScheme.background,
        child: Column(
          children: [
            //logo
            const DrawerHeader(
                child: Column(
                  children: [
                    appLogo(imagePath: "lib/images/app_logo.jpg"),
                  ],
                ),
            ),

            //home list tile
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: ListTile(
                title: const Text('H O M E'),
                leading: const Icon(Icons.home_filled),
                onTap: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => HomePage()));
                },
              ),
            ),

            //settings list tile
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: ListTile(
                title: const Text('S E T T I N G S'),
                leading: const Icon(Icons.settings),
                onTap: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => const Settings()));
                },
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: ListTile(
                title: const Text('C O N T A C T S'),
                leading: const Icon(Icons.contacts_sharp),
                onTap: () {
                  Navigator.of(context);
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => const Contacts()));
                },
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: ListTile(
                title: const Text('C H A T F O L D E R S'),
                leading: const Icon(Icons.folder),
                onTap: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => const chatFolders()));
                },
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: ListTile(
                title: const Text('P E O P L E N E A R B Y'),
                leading: const Icon(Icons.location_on),
                onTap: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => const Settings()));
                },
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: ListTile(
                title: const Text('S A V E D  M S G S'),
                leading: const Icon(Icons.bookmark),
                onTap: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => const SavedMessages()));
                },
              ),
            ),

            //logout list tile
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: ListTile(
                title: const Text('L O G O U T'),
                leading: const Icon(Icons.logout),
                onTap: logout,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
