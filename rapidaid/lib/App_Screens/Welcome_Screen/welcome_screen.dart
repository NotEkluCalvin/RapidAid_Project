// import 'package:flutter/material.dart';
// import 'package:rapidaidv2/App_Components/App_Style/colors.dart';
// import 'package:rapidaidv2/App_Components/App_Widgets/custom_button.dart';
// import 'package:rapidaidv2/App_Screens/Authentication/Login_Screen/login_screen.dart';
// import 'package:rapidaidv2/App_Screens/Authentication/Sign_In/sign_up_Screen.dart';

// class WelcomeScreen extends StatelessWidget {
//   const WelcomeScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: const BoxDecoration(
//         gradient: LinearGradient(
//           colors: [myMainColor, Colors.white, myAltColor],
//           begin: Alignment.topRight,
//           end: Alignment.bottomRight,
//         ),
//       ),
//       child: Center(
//         child: Padding(
//           padding: const EdgeInsets.all(15.0),
//           child: Card(
//             elevation: 2,
//             shadowColor: myMainColor,
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 ClipRRect(
//                   child: Image.asset(
//                     width: 300,
//                     height: 300,
//                     // replace with logo
//                     'assets/images/emergency_services.png',
//                     fit: BoxFit.cover,
//                     errorBuilder: (context, error, stackTrace) {
//                       return Container(
//                         height: 80,
//                         width: 80,
//                         color: Colors.white,
//                       );
//                     },
//                   ),
//                 ),

//                 SizedBox(height: 30),
//                 Card(
//                   elevation: 4,
//                   shadowColor: myMainColor,
//                   child: Padding(
//                     padding: EdgeInsets.fromLTRB(20, 30, 20, 30),
//                     child: Row(
//                       children: [
//                         Flexible(
//                           child: MyCardButton(
//                             text: 'Login',
//                             onPressed: () {
//                               Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                   builder: (context) => LoginScreen(),
//                                 ),
//                               );
//                             },
//                           ),
//                         ),
//                         Flexible(
//                           child: MyCardButton(
//                             text: 'Sign Up',
//                             onPressed: () {
//                               Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                   builder: (context) => SignUpScreen(),
//                                 ),
//                               );
//                             },
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
//import 'package:rapidaidv2/App_Components/App_Style/colors.dart';
import 'package:rapidaidv2/App_Screens/Authentication/Login_Screen/login_screen.dart';
import 'package:rapidaidv2/App_Screens/Authentication/Sign_In/sign_up_Screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 20),

                // App Logo
                Image.asset('assets/images/app_logo.png', height: 50),

                const SizedBox(height: 40),

                // User Icon
                const Icon(
                  Icons.account_circle,
                  size: 180,
                  color: Color.fromARGB(255, 229, 29, 14),
                ),

                const SizedBox(height: 30),

                // Welcome Text
                const Text(
                  'WELCOME!',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 229, 29, 14),
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Stay safe, stay connected.',
                  style: TextStyle(fontSize: 14, color: Colors.black87),
                ),

                const SizedBox(height: 60),

                // Buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Sign Up Button (Outlined)
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Color.fromARGB(255, 229, 29, 14),
                        side: const BorderSide(color: Colors.red),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 12,
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SignUpScreen(),
                          ),
                        );
                      },
                      child: const Text(
                        'Sign Up',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(width: 20),
                    // Login Button (Filled)
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 229, 29, 14),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 28,
                          vertical: 12,
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginScreen(),
                          ),
                        );
                      },
                      child: const Text(
                        'Login',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
