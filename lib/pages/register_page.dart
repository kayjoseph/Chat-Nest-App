import 'package:chat_nest/authentication/auth_service.dart';
import 'package:chat_nest/components/button.dart';
import 'package:chat_nest/components/textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key, required this.onTap});

  // email and pw controllers
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  // tap to navigate to register page
  final void Function()? onTap;

  void register(BuildContext context){
    //get auth service
    final _auth = AuthService();

    // if passwords match then create user
    if(_passwordController.text == _confirmPasswordController.text){
      try{
        _auth.signUpWithEmailPassword(
             _emailController.text,
             _passwordController.text);
      } catch (e) {
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text(e.toString()),
            ));
      }
    }

    // if passwords don't match tell the user to fix
    else{
      showDialog(
          context: context,
          builder: (context) => const AlertDialog(
            title: Text("Passwords don't match"),
          ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text('Welcome to ChatNest App',
          style: TextStyle(color: Colors.white,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //Logo
            const Icon(Icons.message, size: 60, color: Colors.green,),
            //Welcome Back Message
            const Text("Let's create an account for you", style: TextStyle(fontSize: 18),),
            const SizedBox(height: 20,),
            //Email TextField
            MyTextField(
              hintText: "Email",
              controller: _emailController,
            ),
            const SizedBox(height: 20,),
            //PW TextField
            MyTextField(
              hintText: "Password",
              controller: _passwordController,
            ),
            const SizedBox(height: 25),
            // confirm password
            MyTextField(
              hintText: "Confirm Password",
              controller: _confirmPasswordController,
            ),
            const SizedBox(height: 25),
            //Login
            MyButton(
              text: "Register",
              onTap: () => register(context),
            ),
            const SizedBox(height: 20,),
            //Register Now
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Already have an account'),
                const SizedBox(width: 8,),
                GestureDetector(
                  onTap: onTap,
                  child: const Text('Login now',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
