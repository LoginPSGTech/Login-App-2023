import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:login/api/auth.dart';
import 'package:login/models/auth.dart';
import 'package:login/pages/register_page.dart';
import 'package:login/widgets/gradient_background_widget.dart';
import 'package:login/pages/main_page.dart';
import 'package:login/widgets/text_field_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> verifyLoginformKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    void handleLogin() {
      LoginModel loginInfo = LoginModel(email: _emailController.text, password: _passwordController.text);
      AuthApi.login(loginInfo).then((value) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const MainPage()),
        );
      });
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
                        Form(
                            key: verifyLoginformKey,
                            child: Column(
                              children: [
                                TextFieldWidget(
                                    controller: _emailController,
                                    labelText: "Email Address",
                                    isPassword: false,
                                    prefixIcon: Icons.account_circle,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Email Address is Required';
                                      }
                                      return null;
                                    }),
                                TextFieldWidget(
                                  controller: _passwordController,
                                  labelText: "Password",
                                  isPassword: true,
                                  prefixIcon: Icons.key,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Password is Required';
                                    }
                                    return null;
                                  },
                                  suffixIcon: Icons.visibility, // Pass the suffix icon
                                  onSuffixIconPressed: () {
                                    // Handle the suffix icon press (e.g., toggle password visibility)
                                  },
                                ),
                              ],
                            )),

                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFF55353),
                            ),
                            onPressed: () {
                              // Validate and perform login
                              if (verifyLoginformKey.currentState!.validate()) {
                                handleLogin();
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
                                  fontSize: 16,
                                  color: Color(0xFFF55353),
                                  decoration: TextDecoration.none,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const RegisterPage(isAlumni: false), // Replace with your LoginPage class
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
                                  fontSize: 16,
                                  color: Color(0xFFFEB139),
                                  decoration: TextDecoration.none,
                                ),
                                recognizer: TapGestureRecognizer()..onTap = () {},
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
    ));
  }
}
