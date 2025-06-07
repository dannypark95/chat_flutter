import 'package:flutter/material.dart';
import 'package:chat_flutter/components/drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home Page')),
      drawer: MyDrawer(),
      body: Center(
        child: Text(
          'Welcome to the Home Page!',
          style: TextStyle(fontSize: 24, color: Theme.of(context).primaryColor),
        ),
      ),
    );
  }
}
