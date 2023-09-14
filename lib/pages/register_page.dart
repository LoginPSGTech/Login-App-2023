import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:login/api/auth.dart';
import 'package:login/api/user.dart';
import 'package:login/models/user.dart';
import 'package:login/pages/login_page.dart';
import 'package:login/pages/main_page.dart';
import 'package:login/widgets/gradient_background_widget.dart';
import 'package:login/widgets/snackbar_widget.dart';
import 'package:login/widgets/text_field_widget.dart';

import 'form_constants.dart';

class RegisterPage extends StatefulWidget {
  final bool isAlumni;
  const RegisterPage({super.key, required this.isAlumni});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final PageController _pageController = PageController();

  final GlobalKey<FormState> studentDetailsformKey = GlobalKey<FormState>();
  final GlobalKey<FormState> verifyEmailformKey = GlobalKey<FormState>();
  final GlobalKey<FormState> setPasswordformKey = GlobalKey<FormState>();
  final GlobalKey<FormState> additionalPreferencesformKey = GlobalKey<FormState>();

  final TextEditingController studentNameController = TextEditingController();
  final TextEditingController studentContactController = TextEditingController();
  final TextEditingController studentRollNoController = TextEditingController();
  final TextEditingController collegeNameController = TextEditingController();
  final TextEditingController collegeCodeController = TextEditingController();
  final TextEditingController degreeController = TextEditingController();
  final TextEditingController streamController = TextEditingController();
  final TextEditingController yearOfStudyController = TextEditingController();
  final TextEditingController genderController = TextEditingController();
  final TextEditingController studentEmailController = TextEditingController();
  final TextEditingController otpController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final TextEditingController foodPreferenceController = TextEditingController();
  final TextEditingController accommodationRequiredController = TextEditingController();

  int _currentPage = 0;

  void _initializeRegistration() {
    EasyLoading.show(status: "Registering User...");
    UserCreateModel userCreate = UserCreateModel(
        email: studentEmailController.text,
        password: passwordController.text,
        college: collegeNameController.text,
        code: collegeCodeController.text,
        name: studentNameController.text,
        gender: genders[genderController.text]!,
        phoneNumber: studentContactController.text,
        rollNumber: studentRollNoController.text,
        yearOfStudy: yearsOfStudy[yearOfStudyController.text]!,
        isAccommodationRequired: accommodation[accommodationRequiredController.text]!,
        dietType: foodPreference[foodPreferenceController.text]!,
        degree: degrees[degreeController.text]!,
        stream: streams[streamController.text]!,
        otp: otpController.text);
    UserApi.createUser(userCreate).then((value) => {
        EasyLoading.dismiss(),
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => const MainPage(), // Replace with your LoginPage class
            ),
          )
        }).catchError((err){
          EasyLoading.dismiss();
          SnackbarWidget.showMessage(context, "Error", "Error occurred while registering user. Please try again.", ContentType.failure);
        });
  }

  void _verifyEmailAddress() {
    AuthApi.verifyEmail(studentEmailController.text).then((value){
      SnackbarWidget.showMessage(context, "Success", "OTP Sent to your Mail", ContentType.success);
    }).catchError((err){
      SnackbarWidget.showMessage(context, "Error", "Error verifying Email Address", ContentType.failure);
    });
  }

  void _validatePage() {
    switch (_currentPage) {
      case 0:
        if (studentDetailsformKey.currentState!.validate()) {
          _nextPage();
        }
        break;
      case 1:
        if (verifyEmailformKey.currentState!.validate()) {
          _nextPage();
        }
        break;
      case 2:
        if (setPasswordformKey.currentState!.validate()) {
          _nextPage();
        }
        break;
      case 3:
        if (additionalPreferencesformKey.currentState!.validate()) {
          _initializeRegistration();
        }
        break;
      default:
    }
  }

  void _nextPage() {
    if (_currentPage == 0) {}
    if (_currentPage < 3) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeIn,
      );
      setState(() {
        _currentPage++;
      });
    }
  }

  void _previousPage() {
    if (_currentPage > 0) {
      _pageController.previousPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.ease,
      );
      setState(() {
        _currentPage--;
      });
    }
  }

  Widget buildRegistrationStep(String stepTitle, List<Widget> stepWidgets) {
    final ScrollController pageViewController = ScrollController();
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 8.0),
      children: [
        Center(
          child: Text(
            stepTitle,
            style: const TextStyle(
              fontFamily: 'Poppins',
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Color(0xFFFEB139),
            ),
          ),
        ),
        const SizedBox(
          height: 16.0,
        ),
        Scrollbar(
          controller: pageViewController,
          thumbVisibility: true,
          thickness: 5,
          child: SingleChildScrollView(
            controller: pageViewController,
            child: Column(
              children: stepWidgets,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    List<TextFieldWidget> studentDetailsForm = [
      TextFieldWidget(
        controller: studentNameController, // Provide the TextEditingController
        labelText: 'Student Name', // Provide the label text
        isPassword: false, // Indicate whether it's a password field
        prefixIcon: Icons.person, // Provide the prefix icon
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Student Name is Required';
          }
          if (!RegExp(r'^[a-zA-Z ]+$').hasMatch(value)) {
            return 'Student Name should only contain letters and spaces';
          }

          if (value.length < 3) {
            return 'Student Name should atleast be 3 characters long';
          }
          return null;
        },
      ),
      TextFieldWidget(
          controller: studentContactController, // Provide the TextEditingController
          labelText: 'Contact Number', // Provide the label text
          isPassword: false, // Indicate whether it's a password field
          prefixIcon: Icons.phone, // Provide the prefix icon
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Contact Number is Required';
            }
            if (!RegExp(r'^[1-9]\d{9}$').hasMatch(value)) {
              return 'Invalid Contact Number';
            }
            return null;
          },
          keyboardType: TextInputType.number),
      TextFieldWidget(
        controller: genderController, // Provide the TextEditingController
        labelText: 'Gender', // Provide the label text
        isPassword: false, // Indicate whether it's a password field
        prefixIcon: Icons.male_rounded, // Provide the prefix icon
        validator: (value) {
          if (value == null || value.isEmpty || value == 'Select Gender') {
            return 'Gender is Required';
          }
          return null;
        },
        dropdownItems: [
          const DropdownMenuItem<String>(
            value: 'Select Gender',
            child: Text('Select Gender'),
          ),
          for (var gender in genders.keys.toList())
            DropdownMenuItem<String>(
              value: gender,
              child: Text(gender),
            ),
        ],
        onDropdownChanged: (value) {
          genderController.text = value!;
        },
        dropdownValue: 'Select Gender',
      ),
      TextFieldWidget(
        controller: studentRollNoController, // Provide the TextEditingController
        labelText: 'Roll Number', // Provide the label text
        isPassword: false, // Indicate whether it's a password field
        prefixIcon: Icons.tag, // Provide the prefix icon
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Student Roll Number is Required';
          }
          return null;
        },
      ),
      TextFieldWidget(
        controller: collegeNameController, // Provide the TextEditingController
        labelText: 'College Name', // Provide the label text
        isPassword: false, // Indicate whether it's a password field
        prefixIcon: Icons.account_balance, // Provide the prefix icon
        validator: (value) {
          if (value == null || value.isEmpty || value == 'Select a College') {
            return 'College Name is Required';
          }
          return null;
        },
        dropdownItems: [
          const DropdownMenuItem<String>(
            value: 'Select a College',
            child: Text('Select a College'),
          ),
          for (var college in collegeCode.keys.toList())
            DropdownMenuItem<String>(
              value: college,
              child: Text(college),
            ),
          const DropdownMenuItem<String>(
            value: 'Other',
            child: Text('Other'),
          ),
        ],
        onDropdownChanged: (value) {
          collegeNameController.text = value!;
        },
        dropdownValue: 'Select a College',
      ),
      TextFieldWidget(
        controller: collegeCodeController, // Provide the TextEditingController
        labelText: 'College Code', // Provide the label text
        isPassword: false, // Indicate whether it's a password field
        prefixIcon: Icons.tag, // Provide the prefix icon
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'College Code is Required';
          }
          if (value != collegeCode[collegeNameController.text]) {
            return 'Invalid College Code. \nContact login2023.help@gmail.com to verify.';
          }
          return null;
        },
      ),
      TextFieldWidget(
        controller: degreeController, // Provide the TextEditingController
        labelText: 'Degree', // Provide the label text
        isPassword: false, // Indicate whether it's a password field
        prefixIcon: Icons.school, // Provide the prefix icon
        validator: (value) {
          if (value == null || value.isEmpty || value == 'Select a Degree') {
            return 'Degree is Required';
          }
          return null;
        },
        dropdownItems: [
          const DropdownMenuItem<String>(
            value: 'Select a Degree',
            child: Text('Select a Degree'),
          ),
          for (var degree in degrees.keys.toList())
            DropdownMenuItem<String>(
              value: degree,
              child: Text(degree),
            ),
        ],
        onDropdownChanged: (value) {
          degreeController.text = value!;
        },
        dropdownValue: 'Select a Degree',
      ),
      TextFieldWidget(
        controller: streamController, // Provide the TextEditingController
        labelText: 'Stream', // Provide the label text
        isPassword: false, // Indicate whether it's a password field
        prefixIcon: Icons.fork_right_rounded, // Provide the prefix icon
        validator: (value) {
          if (value == null || value.isEmpty || value == 'Select a Stream') {
            return 'Stream is Required';
          }
          return null;
        },
        dropdownItems: [
          const DropdownMenuItem<String>(
            value: 'Select a Stream',
            child: Text('Select a Stream'),
          ),
          for (var stream in streams.keys.toList())
            DropdownMenuItem<String>(
              value: stream,
              child: Text(stream),
            ),
        ],
        onDropdownChanged: (value) {
          streamController.text = value!;
        },
        dropdownValue: 'Select a Stream',
      ),
      TextFieldWidget(
        controller: yearOfStudyController, // Provide the TextEditingController
        labelText: 'Year of Study', // Provide the label text
        isPassword: false, // Indicate whether it's a password field
        prefixIcon: Icons.calendar_month, // Provide the prefix icon
        validator: (value) {
          if (value == null || value.isEmpty || value == 'Select Year of Study') {
            return 'Year of Study is Required';
          }
          return null;
        },
        dropdownItems: [
          const DropdownMenuItem<String>(
            value: 'Select Year of Study',
            child: Text('Select Year of Study'),
          ),
          for (var year in yearsOfStudy.keys.toList())
            DropdownMenuItem<String>(
              value: year,
              child: Text(year),
            ),
        ],
        onDropdownChanged: (value) {
          yearOfStudyController.text = value!;
        },
        dropdownValue: 'Select Year of Study',
      ),
    ];
    List<TextFieldWidget> alumniDetailsForm = [
      TextFieldWidget(
        controller: studentNameController, // Provide the TextEditingController
        labelText: 'Alumnus Name', // Provide the label text
        isPassword: false, // Indicate whether it's a password field
        prefixIcon: Icons.person, // Provide the prefix icon
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Alumnus Name is Required';
          }
          if (!RegExp(r'^[a-zA-Z ]+$').hasMatch(value)) {
            return 'Alumnus Name should only contain letters and spaces';
          }

          if (value.length < 2) {
            return 'Alumnus Name should atleast be 3 characters long';
          }
          return null;
        },
      ),
      TextFieldWidget(
          controller: studentContactController, // Provide the TextEditingController
          labelText: 'Contact Number', // Provide the label text
          isPassword: false, // Indicate whether it's a password field
          prefixIcon: Icons.phone, // Provide the prefix icon
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Contact Number is Required';
            }
            if (!RegExp(r'^[1-9]\d{9}$').hasMatch(value)) {
              return 'Invalid Contact Number';
            }
            return null;
          },
          keyboardType: TextInputType.number),
      TextFieldWidget(
        controller: genderController, // Provide the TextEditingController
        labelText: 'Gender', // Provide the label text
        isPassword: false, // Indicate whether it's a password field
        prefixIcon: Icons.male_rounded, // Provide the prefix icon
        validator: (value) {
          if (value == null || value.isEmpty || value == 'Select Gender') {
            return 'Gender is Required';
          }
          return null;
        },
        dropdownItems: [
          const DropdownMenuItem<String>(
            value: 'Select Gender',
            child: Text('Select Gender'),
          ),
          for (var gender in genders.keys.toList())
            DropdownMenuItem<String>(
              value: gender,
              child: Text(gender),
            ),
        ],
        onDropdownChanged: (value) {
          genderController.text = value!;
        },
        dropdownValue: 'Select Gender',
      ),
      TextFieldWidget(
        controller: studentRollNoController, // Provide the TextEditingController
        labelText: 'Roll Number', // Provide the label text
        isPassword: false, // Indicate whether it's a password field
        prefixIcon: Icons.tag, // Provide the prefix icon
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Alumnus Roll Number is Required';
          }
          return null;
        },
      ),
      TextFieldWidget(
        controller: collegeCodeController, // Provide the TextEditingController
        labelText: 'Alumnus Code', // Provide the label text
        isPassword: false, // Indicate whether it's a password field
        prefixIcon: Icons.tag, // Provide the prefix icon
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Alumnus Code is Required';
          }
          return null;
        },
      ),
      TextFieldWidget(
        controller: streamController, // Provide the TextEditingController
        labelText: 'Stream', // Provide the label text
        isPassword: false, // Indicate whether it's a password field
        prefixIcon: Icons.fork_right_rounded, // Provide the prefix icon
        validator: (value) {
          if (value == null || value.isEmpty || value == 'Select a Stream') {
            return 'Stream is Required';
          }
          return null;
        },
        dropdownItems: [
          const DropdownMenuItem<String>(
            value: 'Select a Stream',
            child: Text('Select a Stream'),
          ),
          for (var stream in streams.keys.toList())
            DropdownMenuItem<String>(
              value: stream,
              child: Text(stream),
            ),
        ],
        onDropdownChanged: (value) {
          streamController.text = value!;
        },
        dropdownValue: 'Select a Stream',
      ),
    ];
    List<TextFieldWidget> verifyEmailForm = [
      TextFieldWidget(
        controller: studentEmailController, // Provide the TextEditingController
        labelText: 'Email Address', // Provide the label text
        isPassword: false, // Indicate whether it's a password field
        prefixIcon: Icons.mail, // Provide the prefix icon
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Email Address is Required';
          }
          final emailRegex = RegExp(
            r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$',
            caseSensitive: false,
          );

          if (!emailRegex.hasMatch(value)) {
            return 'Enter a Valid Email address';
          }
          return null;
        },
        suffixButton: Container(
          margin: const EdgeInsets.fromLTRB(0, 0, 8, 0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            color: const Color(0xFFFEB139),
          ),
          child: ElevatedButton(
            onPressed: _verifyEmailAddress,
            style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFFEB139),
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 0) // Make the button transparent/ Remove padding
                ),
            child: const Text('Verify',
                style: TextStyle(
                  color: Colors.white,
                )),
          ),
        ),
      ),
      TextFieldWidget(
        controller: otpController, // Provide the TextEditingController
        labelText: 'OTP', // Provide the label text
        isPassword: false, // Indicate whether it's a password field
        prefixIcon: Icons.lock, // Provide the prefix icon
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'OTP is Required';
          }
          if (value.length != 6 || int.tryParse(value) == null) {
            return 'Enter a Valid OTP';
          }
          return null;
        },
        keyboardType: TextInputType.number,
      ),
    ];
    List<TextFieldWidget> setPasswordForm = [
      TextFieldWidget(
        controller: passwordController,
        labelText: "Password",
        isPassword: true,
        prefixIcon: Icons.key,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Password is Required';
          }
          if (value.length < 8) {
            return 'Password must be at least 8 characters long';
          }

          // Check if the password contains at least one special character
          if (!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
            return 'Password must contain a special character';
          }

          // Check if the password contains at least one number
          if (!value.contains(RegExp(r'[0-9]'))) {
            return 'Password must contain a number';
          }

          // Check if the password contains at least one uppercase letter
          if (!value.contains(RegExp(r'[A-Z]'))) {
            return 'Password must contain an uppercase letter';
          }

          // Check if the password contains at least one lowercase letter
          if (!value.contains(RegExp(r'[a-z]'))) {
            return 'Password must contain a lowercase letter';
          }
          return null;
        },
        suffixIcon: Icons.visibility, // Pass the suffix icon
        onSuffixIconPressed: () {
          // Handle the suffix icon press (e.g., toggle password visibility)
        },
      ),
      TextFieldWidget(
        controller: confirmPasswordController,
        labelText: "Confirm Password",
        isPassword: true,
        prefixIcon: Icons.key,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Confirm Password is Required';
          }

          if (passwordController.text != confirmPasswordController.text) {
            return 'Passwords do not match';
          }
          return null;
        },
        suffixIcon: Icons.visibility, // Pass the suffix icon
        onSuffixIconPressed: () {
          // Handle the suffix icon press (e.g., toggle password visibility)
        },
      )
    ];
    List<TextFieldWidget> additionalPreferencesForm = [
      TextFieldWidget(
        controller: foodPreferenceController, // Provide the TextEditingController
        labelText: 'Food Preference', // Provide the label text
        isPassword: false, // Indicate whether it's a password field
        prefixIcon: Icons.food_bank_rounded, // Provide the prefix icon
        validator: (value) {
          if (value == null || value.isEmpty || value == 'Select Food Preference') {
            return 'Food Preference is Required';
          }
          return null;
        },
        dropdownItems: const [
          DropdownMenuItem<String>(
            value: 'Select Food Preference',
            child: Text('Select Food Preference'),
          ),
          DropdownMenuItem<String>(
            value: "Veg",
            child: Text("Veg"),
          ),
          DropdownMenuItem<String>(
            value: "Non-Veg",
            child: Text("Non-Veg"),
          ),
        ],
        onDropdownChanged: (value) {
          foodPreferenceController.text = value!;
        },
        dropdownValue: 'Select Food Preference',
      ),
      TextFieldWidget(
        controller: accommodationRequiredController, // Provide the TextEditingController
        labelText: 'Is Accommodation Required?', // Provide the label text
        isPassword: false, // Indicate whether it's a password field
        prefixIcon: Icons.home, // Provide the prefix icon
        validator: (value) {
          if (value == null || value.isEmpty || value == 'Select an Option') {
            return 'Field is Required';
          }
          return null;
        },
        dropdownItems: const [
          DropdownMenuItem<String>(
            value: 'Select an Option',
            child: Text('Select an Option'),
          ),
          DropdownMenuItem<String>(
            value: "Yes",
            child: Text("Yes"),
          ),
          DropdownMenuItem<String>(
            value: "No",
            child: Text("No"),
          ),
        ],
        onDropdownChanged: (value) {
          accommodationRequiredController.text = value!;
        },
        dropdownValue: 'Select an Option',
      ),
    ];

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
                    padding: const EdgeInsets.all(16),
                    margin: const EdgeInsets.fromLTRB(24, 0, 24, 0),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                      color: Color(0xFF143F6B),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 8,
                        ),
                        Center(
                          child: Text(
                            widget.isAlumni ? "Alumni Registration" : "Student Registration",
                            style: const TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.5,
                            child: PageView(
                              controller: _pageController,
                              physics: const NeverScrollableScrollPhysics(),
                              children: [
                                Form(
                                  key: studentDetailsformKey,
                                  child: widget.isAlumni
                                      ? buildRegistrationStep('Alumni Details', alumniDetailsForm)
                                      : buildRegistrationStep('Student Details', studentDetailsForm),
                                ),
                                Form(
                                  key: verifyEmailformKey,
                                  child: buildRegistrationStep('Verify Email Address', verifyEmailForm),
                                ),
                                Form(
                                  key: setPasswordformKey,
                                  child: buildRegistrationStep('Set a Password', setPasswordForm),
                                ),
                                Form(
                                  key: additionalPreferencesformKey,
                                  child: buildRegistrationStep(
                                      'Student Additional Preferences', additionalPreferencesForm),
                                ),
                              ],
                            )),
                        const SizedBox(
                          height: 16.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            if (_currentPage > 0)
                              ElevatedButton(
                                onPressed: _previousPage,
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xffFEB139),
                                ),
                                child: const Text(
                                  "Back",
                                  style: TextStyle(color: Color(0xff152739), fontFamily: 'Poppins'),
                                ),
                              ),
                            if (_currentPage == 0) const SizedBox(),
                            ElevatedButton(
                              onPressed: _validatePage,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xffF55353),
                              ),
                              child: Text(
                                _currentPage < 3 ? 'Next' : 'Finish',
                                style: const TextStyle(color: Colors.white, fontFamily: 'Poppins'),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 24.0,
                        ),
                        RichText(
                          text: TextSpan(
                            children: [
                              const TextSpan(
                                text: "Already have an account? ",
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
                                        builder: (context) => const LoginPage(),
                                      ),
                                    );
                                  },
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 24.0,
                        ),
                        widget.isAlumni
                            ? RichText(
                                text: TextSpan(
                                  children: [
                                    const TextSpan(
                                      text: "Are you a Student? ",
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                    TextSpan(
                                      text: "Register",
                                      style: const TextStyle(
                                        fontSize: 16,
                                        color: Color(0xFFFEB139),
                                        decoration: TextDecoration.none,
                                      ),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          Navigator.of(context).pushReplacement(
                                            MaterialPageRoute(
                                              builder: (context) => const RegisterPage(isAlumni: false),
                                            ),
                                          );
                                        },
                                    ),
                                  ],
                                ),
                              )
                            : RichText(
                                text: TextSpan(
                                  children: [
                                    const TextSpan(
                                      text: "Are you an Alumni? ",
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                    TextSpan(
                                      text: "Register",
                                      style: const TextStyle(
                                        fontSize: 16,
                                        color: Color(0xFFFEB139),
                                        decoration: TextDecoration.none,
                                      ),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          Navigator.of(context).pushReplacement(
                                            MaterialPageRoute(
                                              builder: (context) => const RegisterPage(isAlumni: true),
                                            ),
                                          );
                                        },
                                    ),
                                  ],
                                ),
                              ),
                        const SizedBox(
                          height: 24.0,
                        ),
                      ],
                    ),
                  ),
                ]),
          ),
        ),
      ),
    )));
  }
}
