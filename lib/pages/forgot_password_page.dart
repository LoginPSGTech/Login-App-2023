import 'dart:io';

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:login/api/auth.dart';
import 'package:login/pages/login_page.dart';
import 'package:login/widgets/gradient_background_widget.dart';
import 'package:login/widgets/snackbar_widget.dart';
import 'package:login/widgets/text_field_widget.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final PageController _pageController = PageController();
  final GlobalKey<FormState> verifyEmailFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> verifyOTPFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> verifyPasswordFormKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _otpController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  int _currentPage = 0;
  bool hidePassword = true;

  void _validatePage() {
    switch (_currentPage) {
      case 0:
        if (verifyEmailFormKey.currentState!.validate()) {
          _verifyEmailAddress();
        }
        break;
      case 1:
        if (verifyOTPFormKey.currentState!.validate()) {
          _nextPage();
        }
        break;
      case 2:
        if (verifyPasswordFormKey.currentState!.validate()) {
          //TODO
        }
        break;
      default:
    }
  }

  void _verifyEmailAddress() {
    EasyLoading.show(status: 'Sending OTP...');
    AuthApi.verifyEmail(_emailController.text).then((value) {
      SnackbarWidget.showMessage(
          context, "Success", "OTP Sent to your Mail", ContentType.success);
          _nextPage();
      EasyLoading.dismiss();
    }).catchError((err) {
      SnackbarWidget.showMessage(
          context, "Error", err.message, ContentType.failure);
      EasyLoading.dismiss();
    });
  }

  void _nextPage() {
    if (_currentPage == 0) {}
    if (_currentPage < 2) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeIn,
      );
      setState(() {
        _currentPage++;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
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
                              "Reset Password",
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
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.195,
                            child: PageView(
                              controller: _pageController,
                              physics: const NeverScrollableScrollPhysics(),
                              children: [
                                Form(
                                  key: verifyEmailFormKey,
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
                                        },
                                      ),
                                      SizedBox(
                                        width: double.infinity,
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                                const Color(0xFFF55353),
                                          ),
                                          onPressed: () {
                                            // Validate and perform login
                                            _validatePage();
                                          },
                                          child: const Text(
                                            'Send OTP',
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Form(
                                  key: verifyOTPFormKey,
                                  child: Column(
                                    children: [
                                      TextFieldWidget(
                                        controller: _otpController,
                                        labelText: 'OTP',
                                        // Provide the label text
                                        isPassword: false,
                                        // Indicate whether it's a password field
                                        prefixIcon: Icons.lock,
                                        // Provide the prefix icon
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'OTP is Required';
                                          }
                                          if (value.length != 6 ||
                                              int.tryParse(value) == null) {
                                            return 'Enter a Valid OTP';
                                          }
                                          return null;
                                        },
                                        keyboardType: TextInputType.number,
                                      ),
                                      SizedBox(
                                        width: double.infinity,
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                                const Color(0xFFF55353),
                                          ),
                                          onPressed: () {
                                            // Validate and perform login
                                            _validatePage();
                                          },
                                          child: const Text(
                                            'Verify',
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Form(
                                  key: verifyPasswordFormKey,
                                  child: Column(
                                    children: [
                                      TextFieldWidget(
                                        controller: _passwordController,
                                        labelText: "Password",
                                        isPassword: hidePassword,
                                        prefixIcon: Icons.key,
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Password is Required';
                                          }
                                          if (value.length < 8) {
                                            return 'Password must be at least 8 characters long';
                                          }

                                          // Check if the password contains at least one special character
                                          if (!value.contains(RegExp(
                                              r'[!@#$%^&*(),.?":{}|<>]'))) {
                                            return 'Password must contain a special character';
                                          }

                                          // Check if the password contains at least one number
                                          if (!value
                                              .contains(RegExp(r'[0-9]'))) {
                                            return 'Password must contain a number';
                                          }

                                          // Check if the password contains at least one uppercase letter
                                          if (!value
                                              .contains(RegExp(r'[A-Z]'))) {
                                            return 'Password must contain an uppercase letter';
                                          }

                                          // Check if the password contains at least one lowercase letter
                                          if (!value
                                              .contains(RegExp(r'[a-z]'))) {
                                            return 'Password must contain a lowercase letter';
                                          }
                                          return null;
                                        },
                                        suffixIcon: Icons.visibility,
                                        // Pass the suffix icon
                                        onSuffixIconPressed: () {
                                          setState(() {
                                            hidePassword = !hidePassword;
                                          });
                                          // Handle the suffix icon press (e.g., toggle password visibility)
                                        },
                                      ),
                                      SizedBox(
                                        width: double.infinity,
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                                const Color(0xFFF55353),
                                          ),
                                          onPressed: () {
                                            // Validate and perform login
                                            _validatePage();
                                          },
                                          child: const Text(
                                            'Reset',
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 16),
                          RichText(
                            text: TextSpan(
                              children: [
                                const TextSpan(
                                  text: "Back to  ",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                                TextSpan(
                                  text: "Login",
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
                                              const LoginPage(), // Replace with your LoginPage class
                                        ),
                                      );
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
      ),
    );
  }
}
