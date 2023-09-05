import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:login/pages/login_page.dart';
import 'package:login/widgets/gradient_background_widget.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

final PageController _pageController = PageController();

  int _currentPage = 0;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _nextPage() {
    if (_currentPage < 2) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease,
      );
      setState(() {
        _currentPage++;
      });
    }
  }

  void _previousPage() {
    if (_currentPage > 0) {
      _pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease,
      );
      setState(() {
        _currentPage--;
      });
    }
  }

  List<Widget> buildForm(int stepNumber, String title, Widget content){
    return [
      Text('Step $stepNumber'),
      const SizedBox(height: 16),
      Text(
        title,
        style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
      const SizedBox(height: 16),
      Container(
        child: content,
      )
    ];
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
                          Expanded(
                            child: PageView(
                              controller: _pageController,
                              physics: const NeverScrollableScrollPhysics(),
                              children: buildForm(
                                  1,
                                  'Step 1',
                                  Column(
                                    children: [
                                      const Center(
                                        child: Text(
                                          "Register",
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
                                        height: 24
                                      ), // Add spacing between login UI and links
                                      RichText(
                                        text: TextSpan(
                                          children: [
                                            const TextSpan(
                                              text: "Already have an Account? ",
                                              style: TextStyle(
                                                color: Colors.white,
                                              ),
                                            ),
                                            TextSpan(
                                              text: "Login",
                                              style: const TextStyle(
                                                color: Color(0xFFF55353),
                                                decoration: TextDecoration.none,
                                              ),
                                              recognizer: TapGestureRecognizer()
                                                ..onTap = () {
                                                  Navigator.of(context).pushReplacement(
                                                    MaterialPageRoute(
                                                      builder: (context) => const LoginPage(), // Replace with your LoginPage class
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
                            ),
                          ),
                          
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              if (_currentPage > 0)
                                ElevatedButton(
                                  onPressed: _previousPage,
                                  child: const Text('Back'),
                                ),
                              ElevatedButton(
                                onPressed: _nextPage,
                                child: Text(_currentPage < 2 ? 'Next' : 'Finish'),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        )
      )
    );
  }
}