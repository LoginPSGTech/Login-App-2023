import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:login/pages/register_page.dart';
import 'package:login/widgets/gradient_background_widget.dart';
import 'package:login/pages/main_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    void handleLogin(){
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const MainPage()),
      );
    }

    return GradientBackgroundWidget(
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(30),
                      margin: const EdgeInsets.fromLTRB(24, 0, 24, 0),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(15.0)),
                        color: Color(0xFF143F6B),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Center(
                            child: Text(
                              "Login",
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 30,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 24.0,
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Container(
                              margin: const EdgeInsets.fromLTRB(0, 0, 0, 8),
                              child: const Text(
                                'Email',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.white,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          TextField(
                            controller: _emailController,
                            decoration: InputDecoration(
                                labelText: 'Email',
                                labelStyle: const TextStyle(color: Colors.white, fontSize: 12),
                                hintText: 'Enter your Email',
                                filled: true, // Set to true to enable background color
                                fillColor: const Color(0xff152739),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                prefixIcon: const Icon(
                                  Icons.email,
                                  size: 24,
                                  color: Colors.white,
                                )),
                          ),
                          const SizedBox(
                            height: 24.0,
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Container(
                              margin: const EdgeInsets.fromLTRB(0, 0, 0, 8),
                              child: const Text(
                                'Password',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.white,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ), // Spacer
                          TextField(
                            controller: _passwordController,
                            obscureText: true,
                            decoration: InputDecoration(
                                focusColor: Colors.white,
                                labelText: 'Password',
                                labelStyle: const TextStyle(color: Colors.white, fontSize: 12),
                                hintText: 'Enter your password',
                                filled: true,
                                fillColor: const Color(0xff152739),
                                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
                                prefixIcon: const Icon(
                                  Icons.key,
                                  color: Colors.white,
                                  size: 24,
                                )),
                          ),
                          const SizedBox(
                            height: 24.0
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFFF55353),
                              ),
                              onPressed: () {
                                // Add your login logic here
                                String email = _emailController.text;
                                String password = _passwordController.text;
                                // Validate and perform login
                                if (email.isNotEmpty && password.isNotEmpty) {
                                  handleLogin();
                                } else {
                                  // Show an error message if email or password is empty
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text('Please enter both email and password.'),
                                    ),
                                  );
                                }
                              },
                              child: const Text('Login',
                                  style: TextStyle(
                                    color: Colors.white,
                                  )),
                            ),
                          ),
                          const SizedBox(height: 16), // Add spacing between login UI and links
                          RichText(
                            text: TextSpan(
                              children: [
                                const TextSpan(
                                  text: "Don't have an account? ",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                                TextSpan(
                                  text: "Register",
                                  style: const TextStyle(
                                    color: Color(0xFFF55353),
                                    decoration: TextDecoration.none,
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      Navigator.of(context).pushReplacement(
                                        MaterialPageRoute(
                                          builder: (context) => const RegisterPage(), // Replace with your LoginPage class
                                        ),
                                      );
                                    },
                                ),
                              ],
                            ),
                          ),

                          const SizedBox(height: 16),
                          RichText(
                            text: TextSpan(
                              children: [
                                const TextSpan(
                                  text: "Forgot Password? ",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                                TextSpan(
                                  text: "Reset",
                                  style: const TextStyle(
                                    color: Color(0xFFFEB139),
                                    decoration: TextDecoration.none,
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      
                                    },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      )
    );
  }
}