import 'package:flutter/material.dart';
//import 'package:rapidaidv2/App_Components/App_Style/colors.dart';
import 'package:rapidaidv2/App_Components/App_Widgets/custom_button.dart';
import 'package:rapidaidv2/App_Components/App_Widgets/custom_text_field.dart';
import 'package:rapidaidv2/App_Screens/Authentication/Login_Screen/login_screen.dart';
import 'package:rapidaidv2/App_Screens/Authentication/Sign_In/password_registration.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Red Header Background with Icons
          Container(
            height: size.height * 0.5,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: /*myMainColor*/ Color.fromARGB(255, 229, 29, 14),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(80),
                bottomRight: Radius.circular(80),
              ),
            ),
            child: LayoutBuilder(
              builder: (context, constraints) {
                final width = constraints.maxWidth;
                final height = constraints.maxHeight;

                return Stack(
                  children: [
                    Positioned(
                      top: height * 0.05,
                      left: width * 0.1,
                      child: Image.asset(
                        'assets/icons/ambulance_icon.png',
                        width: 50,
                      ),
                    ),
                    Positioned(
                      top: height * 0.05,
                      right: width * 0.1,
                      child: Image.asset(
                        'assets/icons/medical_icon.png',
                        width: 50,
                      ),
                    ),
                    Positioned(
                      top: height * 0.2,
                      left: width * 0.25,
                      child: Image.asset(
                        'assets/icons/briefcase_icon.png',
                        width: 50,
                      ),
                    ),
                    Positioned(
                      top: height * 0.19,
                      right: width * 0.25,
                      child: Image.asset(
                        'assets/icons/doctor_icon.png',
                        width: 50,
                      ),
                    ),
                    Positioned(
                      bottom: height * 0.5,
                      left: width * -0.025,
                      child: Image.asset(
                        'assets/icons/emergencyexit_icon.png',
                        width: 50,
                      ),
                    ),
                    Positioned(
                      bottom: height * 0.5,
                      right: width * -0.025,
                      child: Image.asset(
                        'assets/icons/emergencyexit_icon.png',
                        width: 50,
                      ),
                    ),
                    Positioned(
                      bottom: height * 0.25,
                      left: width * -0.025,
                      child: Image.asset(
                        'assets/icons/nurse_icon.png',
                        width: 50,
                      ),
                    ),
                    Positioned(
                      bottom: height * 0.25,
                      right: width * -0.025,
                      child: Image.asset(
                        'assets/icons/security_icon.png',
                        width: 50,
                      ),
                    ),
                    Positioned(
                      top: height * 0.08,
                      left: width / 2 - 16,
                      child: Image.asset(
                        'assets/icons/emergencyphone_icon.png',
                        width: 50,
                      ),
                    ),
                  ],
                );
              },
            ),
          ),

          // Sign Up Card
          Align(
            alignment: Alignment.center,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 30),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10,
                    spreadRadius: 2,
                  ),
                ],
              ),
              width: double.infinity,
              height: size.height * 0.7,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      'Create your account',
                      style: Theme.of(
                        context,
                      ).textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  Row(
                    children: [
                      Icon(Icons.person, color: Colors.red),
                      SizedBox(width: 8),
                      Text(
                        'Username',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                  const CustomTextField(
                    hinttext: 'Enter Username',
                    hinttextstyle: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w100,
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Icon(Icons.phone, color: Colors.red),
                      SizedBox(width: 8),
                      Text(
                        'Phone number',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                  const CustomTextField(
                    hinttext: 'Enter Number',
                    hinttextstyle: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w100,
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Icon(Icons.email, color: Colors.red),
                      SizedBox(width: 8),
                      Text(
                        'Email',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                  const CustomTextField(
                    hinttext: 'Enter Email',
                    hinttextstyle: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w100,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Center(
                    child: MyCardButton(
                      text: 'Next',
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PasswordRegistrationScreen(),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Login prompt at the bottom
          Positioned(
            bottom: 50,
            left: 0,
            right: 0,
            child: Center(
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginScreen(),
                    ),
                  );
                },
                child: const Text.rich(
                  TextSpan(
                    text: "Already have an account? ",
                    style: TextStyle(color: Colors.black87),
                    children: [
                      TextSpan(
                        text: "Login here",
                        style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
