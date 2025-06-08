import 'package:flutter/material.dart';
import 'package:chat_flutter/pages/settings_page.dart';
import 'package:chat_flutter/services/auth/auth_service.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  void signOut() async {
    final auth = AuthService();
    await auth.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Logo at the top with tighter space
          Padding(
            padding: const EdgeInsets.only(top: 100),
            child: Center(
              child: Image.asset(
                'assets/main_logo.png',
                width: 150,
                height: 150,
              ),
            ),
          ),

          // Menu items in a Column
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 25),
                child: ListTile(
                  leading: const Icon(Icons.home),
                  title: const Text('H O M E'),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25),
                child: ListTile(
                  leading: const Icon(Icons.settings),
                  title: const Text('S E T T I N G S'),
                  onTap: () {
                    Navigator.pop(context);

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SettingsPage(),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),

          // Logout button aligned at bottom
          Padding(
            padding: const EdgeInsets.only(left: 25, bottom: 20),
            child: ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('L O G O U T'),
              onTap: signOut,
            ),
          ),
        ],
      ),
    );
  }
}
