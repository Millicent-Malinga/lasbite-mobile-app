import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:lasbite/screens/dashboard.dart';
import 'package:lasbite/screens/login.dart';

import '../resources/auth_methods.dart';
import '../utils/utils.dart';

void main() {
  runApp(const MaterialApp(
    home: RegistrationPage(),
  ));
}

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  bool _passwordVisible = false;
  bool _confirmPasswordVisible = false;
   final TextEditingController _fullnameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  bool _isLoading = false;

  final spacer = SizedBox(
    height: 16,
  );

  void SignUpUser() async {
    setState(() {
      _isLoading = true;
    });
    String res = await AuthMethods().signUpUserwithEmail(
        email: _emailController.text,
        password: _passwordController.text,
        confirm: _confirmPasswordController.text,
        fullname: _fullnameController.text,
        );
     setState(() {
      _isLoading = true;
    });
    if (res != 'success') {
      setState(() {
      _isLoading = false;
      showSnackBar(res, context);

    });
       
      // handle errors
    } else {
      //
        setState(() {
      _isLoading = false;
    });
     Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => HomeScreen()
                ));

    
    }
  }

  @override
  void dispose() {
    //implement dispose
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _fullnameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(150),
        child: Stack(
          children: [
            // Background image
            Image.asset(
              'assets/images/Frame 6.jpg',
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
            // AppBar content
            AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              title:  Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Sign Up',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Create your Account',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Align(
              alignment: AlignmentDirectional.centerStart,
              child: Text(
                'Full Name',
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
            ),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Full Name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            const Align(
              alignment: AlignmentDirectional.centerStart,
              child: Text(
                'Email',
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
            ),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            const Align(
              alignment: AlignmentDirectional.centerStart,
              child: Text(
                'Password',
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
            ),
            TextFormField(
              obscureText: !_passwordVisible,
              decoration: InputDecoration(
                labelText: 'Password',
                border: const OutlineInputBorder(),
                suffixIcon: GestureDetector(
                  onTap: () {
                    setState(() {
                      _passwordVisible = !_passwordVisible;
                    });
                  },
                  child: Icon(
                    _passwordVisible ? Icons.visibility : Icons.visibility_off,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Align(
              alignment: AlignmentDirectional.centerStart,
              child: Text(
                'Confirm Password',
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
            ),
            TextFormField(
              controller: _confirmPasswordController,
              validator: (confirm){
                              if(confirm.isEmpty)
                                   return 'Empty';
                              if(val != _passwordController.text)
                                   return 'Not Match'
                              return null;
                              }
                     ),
              obscureText: !_confirmPasswordVisible,
              decoration: InputDecoration(
                labelText: 'Confirm Password',
                border: const OutlineInputBorder(),
                suffixIcon: GestureDetector(
                  onTap: () {
                    setState(() {
                      _confirmPasswordVisible = !_confirmPasswordVisible;
                    });
                  },
                  child: Icon(
                    _confirmPasswordVisible
                        ? Icons.visibility
                        : Icons.visibility_off,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                // Handle registration logic

              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF008000),
                padding:
                    const EdgeInsets.symmetric(horizontal: 130, vertical: 20),
              ),
              child: const Text(
                'Register',
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
            ),
            const SizedBox(height: 50),
            GestureDetector(
              onTap: () {
                // Handle sign in
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SignInScreen()),
                );
              },
              child: RichText(
                text: const TextSpan(
                  children: [
                    TextSpan(
                      text: "Already have an account? ",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    TextSpan(
                      text: "Sign In",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF008000),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
