import 'package:flutter/material.dart';
import 'package:chat_flutter/components/textfield.dart';
import 'package:chat_flutter/components/button.dart';

class RegisterPage extends StatelessWidget {

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  
  final void Function()? onTap;

  RegisterPage({super.key, required this.onTap});

  void register() {
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
            const SizedBox(height: 10),
            // add password confirmation field
            MyTextField(
              hintText: 'Confirm Password',
              obscureText: true,
              controller: _passwordController
            ),
            const SizedBox(height: 20),
            MyButton(
              text: 'Register',
              onTap: register,
            ),
            const SizedBox(height: 10), 
            Row(children: [
              const Spacer(),
              Text("Already a member? ",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                )),
              GestureDetector(
                onTap: onTap,
                child: Text("Login now",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.bold,
                )),
              ),
              const Spacer(),
            ],)
          
          ],
        ),
      )
    );
  }
}