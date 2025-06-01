import 'package:flutter/material.dart';
import 'package:chat_flutter/components/textfield.dart';
import 'package:chat_flutter/components/button.dart';

class LoginPage extends StatelessWidget {

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final void Function()? onTap;

  LoginPage({super.key, required this.onTap});

  void login() {
    // Handle login logic here
    print('Email: ${_emailController.text}');
    print('Password: ${_passwordController.text}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, 



          children: [
            Image.asset('assets/main_logo.png', width: 300, height: 300),
            MyTextField(
              hintText: 'Email',
              obscureText: false,
              controller: _emailController,
            ),
            const SizedBox(height: 10),
            MyTextField(
              hintText: 'Password',
              obscureText: true,
              controller: _passwordController,
            ),
            const SizedBox(height: 20),
            MyButton(
              text: 'Login',
              onTap: login,
            ),
            const SizedBox(height: 10),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Text("Not a member? ",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                )),
              GestureDetector(
                onTap: onTap,
                child: Text("Register now",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.bold,
                )),
              )
            ],)
          
          ],
        ),
      )
    );
  }
}