import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../widgets/custom_button.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Get screen size for responsive design
    final size = MediaQuery.of(context).size;
    final isSmallScreen = size.width < 360;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.1,
            vertical: size.height * 0.05,
          ),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: size.height * 0.05),
                child: Image.asset(
                  'assets/images/app_logo.png',
                  height: 80,
                  color: const Color(0xFFE41F1F), // Logo color in red
                ),
              ),
              SizedBox(height: size.height * 0.1),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Your one-stop platform for assistance with all kinds of emergencies.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: const Color(0xFFE41F1F), // Text in red
                        fontSize: isSmallScreen ? 18 : 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: size.height * 0.15),
                    CustomButton(
                      text: 'Login',
                      onPressed: () => context.go('/login'),
                      backgroundColor: const Color(0xFFE41F1F), // Red button
                      textColor: Colors.white,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: Row(
                        children: [
                          const Expanded(
                            child: Divider(
                              color: Color(0xFFE41F1F), // Red divider
                              thickness: 1,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8.0,
                            ),
                            child: Text(
                              'or',
                              style: TextStyle(
                                color: const Color(0xFFE41F1F), // Red text
                                fontSize: isSmallScreen ? 14 : 16,
                              ),
                            ),
                          ),
                          const Expanded(
                            child: Divider(
                              color: Color(0xFFE41F1F), // Red divider
                              thickness: 1,
                            ),
                          ),
                        ],
                      ),
                    ),
                    CustomButton(
                      text: 'Create account',
                      onPressed: () => context.go('/create-account'),
                      backgroundColor: Colors.white, // White button
                      textColor: const Color(0xFFE41F1F), // Red text
                      //borderColor: const Color(0xFFE41F1F), // Red border
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
