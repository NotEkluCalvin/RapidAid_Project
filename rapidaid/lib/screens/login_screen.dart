// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import '../widgets/custom_text_field.dart';
// import '../widgets/custom_button.dart';
// import '../routes.dart';

// class LoginScreen extends StatefulWidget {
//   const LoginScreen({super.key});

//   @override
//   State<LoginScreen> createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen> {
//   final _formKey = GlobalKey<FormState>();
//   final _usernameOrEmailController = TextEditingController();
//   final _passwordController = TextEditingController();
//   bool _obscurePassword = true;
//   bool _rememberMe = false;

//   @override
//   void dispose() {
//     _usernameOrEmailController.dispose();
//     _passwordController.dispose();
//     super.dispose();
//   }

//   void _showForgotPasswordDialog() {
//     // This functionality could be implemented later
//     ScaffoldMessenger.of(context).showSnackBar(
//       const SnackBar(content: Text('Password reset functionality')),
//     );
//   }

//   void _handleLogin() {
//     if (_formKey.currentState!.validate()) {
//       // Check for the specific credentials: pnyamekye/2025
//       final username = _usernameOrEmailController.text;
//       final password = _passwordController.text;

//       if (username == 'pnyamekye' && password == '2025') {
//         // Show success message
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(
//             content: Text('Login successful!'),
//             backgroundColor: Colors.green,
//           ),
//         );
//         //Navigator.of(context).pushReplacementNamed('/home');
//         context.go('/home');
//       } else {
//         // Show error message
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(
//             content: Text('Invalid username or password'),
//             backgroundColor: Colors.red,
//           ),
//         );
//       }
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     // Get screen size for responsive design
//     final size = MediaQuery.of(context).size;
//     final isSmallScreen = size.width < 360;

//     return Scaffold(
//       backgroundColor: const Color(
//         0xFFE41F1F,
//       ), // Red background matching the image
//       body: SafeArea(
//         child: Stack(
//           children: [
//             // App Icons at the corners (matching the image)
//             Positioned(
//               top: 16,
//               left: 16,
//               child: Icon(
//                 Icons.local_taxi, // Ambulance/car icon
//                 color: Colors.white,
//                 size: 24,
//               ),
//             ),
//             Positioned(
//               top: 16,
//               right: 16,
//               child: Icon(
//                 Icons.medical_services, // Medical icon
//                 color: Colors.white,
//                 size: 24,
//               ),
//             ),
//             Positioned(
//               top: 16,
//               right: size.width * 0.5 - 12,
//               child: Icon(
//                 Icons.call, // Phone icon
//                 color: Colors.white,
//                 size: 24,
//               ),
//             ),
//             Positioned(
//               bottom: 16,
//               left: 16,
//               child: Icon(
//                 Icons.person, // Person icon at bottom left
//                 color: Colors.white,
//                 size: 24,
//               ),
//             ),
//             Positioned(
//               bottom: 16,
//               right: 16,
//               child: Icon(
//                 Icons.shield, // Shield icon
//                 color: Colors.white,
//                 size: 24,
//               ),
//             ),

//             // Main content - white container
//             Center(
//               child: Container(
//                 margin: EdgeInsets.symmetric(
//                   horizontal: size.width * 0.05,
//                   vertical: size.height * 0.05,
//                 ),
//                 padding: EdgeInsets.all(size.width * 0.05),
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(20),
//                 ),
//                 child: Form(
//                   key: _formKey,
//                   child: Column(
//                     mainAxisSize: MainAxisSize.min,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       // Login title
//                       Center(
//                         child: Text(
//                           'Login',
//                           style: TextStyle(
//                             fontSize: 22,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.black87,
//                           ),
//                         ),
//                       ),
//                       SizedBox(height: size.height * 0.03),

//                       // Username field
//                       Row(
//                         children: [
//                           Icon(Icons.person_outline, color: Colors.red),
//                           SizedBox(width: 8),
//                           Expanded(
//                             child: TextFormField(
//                               controller: _usernameOrEmailController,
//                               decoration: InputDecoration(
//                                 hintText: 'Username, phone or email',
//                                 border: UnderlineInputBorder(
//                                   borderSide: BorderSide(color: Colors.red),
//                                 ),
//                                 focusedBorder: UnderlineInputBorder(
//                                   borderSide: BorderSide(color: Colors.red),
//                                 ),
//                               ),
//                               validator: (value) {
//                                 if (value == null || value.isEmpty) {
//                                   return 'Please enter your username, phone or email';
//                                 }
//                                 return null;
//                               },
//                             ),
//                           ),
//                         ],
//                       ),

//                       SizedBox(height: size.height * 0.02),

//                       // Password field
//                       Row(
//                         children: [
//                           Icon(Icons.lock_outline, color: Colors.red),
//                           SizedBox(width: 8),
//                           Expanded(
//                             child: TextFormField(
//                               controller: _passwordController,
//                               obscureText: _obscurePassword,
//                               decoration: InputDecoration(
//                                 hintText: 'Password',
//                                 border: UnderlineInputBorder(
//                                   borderSide: BorderSide(color: Colors.red),
//                                 ),
//                                 focusedBorder: UnderlineInputBorder(
//                                   borderSide: BorderSide(color: Colors.red),
//                                 ),
//                               ),
//                               validator: (value) {
//                                 if (value == null || value.isEmpty) {
//                                   return 'Please enter your password';
//                                 }
//                                 return null;
//                               },
//                             ),
//                           ),
//                         ],
//                       ),

//                       SizedBox(height: 16),

//                       // Remember me and Forgot Password row
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Row(
//                             children: [
//                               SizedBox(
//                                 height: 24,
//                                 width: 24,
//                                 child: Checkbox(
//                                   value: _rememberMe,
//                                   onChanged: (value) {
//                                     setState(() {
//                                       _rememberMe = value ?? false;
//                                     });
//                                   },
//                                   activeColor: const Color(0xFFE41F1F),
//                                 ),
//                               ),
//                               SizedBox(width: 8),
//                               Text(
//                                 'Remember me',
//                                 style: TextStyle(
//                                   fontSize: isSmallScreen ? 12 : 14,
//                                 ),
//                               ),
//                             ],
//                           ),
//                           GestureDetector(
//                             onTap: _showForgotPasswordDialog,
//                             child: Text(
//                               'Forgot Password?',
//                               style: TextStyle(
//                                 fontSize: isSmallScreen ? 12 : 14,
//                                 color: const Color(0xFFE41F1F),
//                                 fontWeight: FontWeight.w500,
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),

//                       SizedBox(height: size.height * 0.04),

//                       // Login button
//                       SizedBox(
//                         width: double.infinity,
//                         child: ElevatedButton(
//                           onPressed: _handleLogin,
//                           style: ElevatedButton.styleFrom(
//                             backgroundColor: const Color(0xFFE41F1F),
//                             foregroundColor: Colors.white,
//                             padding: EdgeInsets.symmetric(vertical: 12),
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(30),
//                             ),
//                           ),
//                           child: Text(
//                             'Login',
//                             style: TextStyle(
//                               fontSize: 16,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ),
//                       ),

//                       SizedBox(height: size.height * 0.04),

//                       // Sign up text
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Text(
//                             'Do not have an account? ',
//                             style: TextStyle(
//                               fontSize: 14,
//                               color: Colors.black87,
//                             ),
//                           ),
//                           GestureDetector(
//                             onTap: () {
//                               // Navigate to sign up page
//                               Navigator.of(
//                                 context,
//                               ).pushNamed('/create-account');
//                             },
//                             child: Text(
//                               'Sign Up',
//                               style: TextStyle(
//                                 fontSize: 14,
//                                 color: const Color(0xFFE41F1F),
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/custom_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _usernameOrEmailController = TextEditingController();
  final _passwordController = TextEditingController();
  final bool _obscurePassword = true;
  bool _rememberMe = false;

  @override
  void dispose() {
    _usernameOrEmailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _showForgotPasswordDialog() {
    // This functionality could be implemented later
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Password reset functionality')),
    );
  }

  void _handleLogin() {
    if (_formKey.currentState!.validate()) {
      // Check for the specific credentials: pnyamekye/2025
      final username = _usernameOrEmailController.text;
      final password = _passwordController.text;

      if (username == 'pnyamekye' && password == '2025') {
        // Show success message
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Login successful!'),
            backgroundColor: Colors.green,
          ),
        );
        // Use Go Router instead of Navigator
        context.go('/home');
      } else {
        // Show error message
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Invalid username or password'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // Get screen size for responsive design
    final size = MediaQuery.of(context).size;
    final isSmallScreen = size.width < 360;

    return Scaffold(
      body: Stack(
        children: [
          // Custom background
          CustomPaint(
            painter: OvalBackgroundPainter(),
            size: Size(size.width, size.height),
          ),

          // App Icons scattered around the red area
          SafeArea(
            child: Stack(
              children: [
                // Top row icons
                Positioned(
                  top: 16,
                  left: 16,
                  child: Icon(Icons.local_taxi, color: Colors.white, size: 24),
                ),
                Positioned(
                  top: 16,
                  right: 16,
                  child: Icon(
                    Icons.medical_services,
                    color: Colors.white,
                    size: 24,
                  ),
                ),
                Positioned(
                  top: 16,
                  right: size.width * 0.5 - 12,
                  child: Icon(Icons.call, color: Colors.white, size: 24),
                ),

                // Middle row icons
                Positioned(
                  top: size.height * 0.15,
                  left: 16,
                  child: Icon(
                    Icons.medical_services,
                    color: Colors.white,
                    size: 24,
                  ),
                ),
                Positioned(
                  top: size.height * 0.15,
                  right: 16,
                  child: Icon(Icons.people, color: Colors.white, size: 24),
                ),

                // Bottom row icons
                Positioned(
                  bottom: 16,
                  left: 16,
                  child: Icon(Icons.person, color: Colors.white, size: 24),
                ),
                Positioned(
                  bottom: 16,
                  right: 16,
                  child: Icon(Icons.shield, color: Colors.white, size: 24),
                ),

                // Main content - white container
                Center(
                  child: Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: size.width * 0.05,
                      vertical: size.height * 0.05,
                    ),
                    padding: EdgeInsets.all(size.width * 0.05),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Login title
                          Center(
                            child: Text(
                              'Login',
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                            ),
                          ),
                          SizedBox(height: size.height * 0.03),

                          // Username field
                          Row(
                            children: [
                              Icon(Icons.person_outline, color: Colors.red),
                              SizedBox(width: 8),
                              Expanded(
                                child: TextFormField(
                                  controller: _usernameOrEmailController,
                                  decoration: InputDecoration(
                                    hintText: 'Username, phone or email',
                                    border: UnderlineInputBorder(
                                      borderSide: BorderSide(color: Colors.red),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: Colors.red),
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter your username, phone or email';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ],
                          ),

                          SizedBox(height: size.height * 0.02),

                          // Password field
                          Row(
                            children: [
                              Icon(Icons.lock_outline, color: Colors.red),
                              SizedBox(width: 8),
                              Expanded(
                                child: TextFormField(
                                  controller: _passwordController,
                                  obscureText: _obscurePassword,
                                  decoration: InputDecoration(
                                    hintText: 'Password',
                                    border: UnderlineInputBorder(
                                      borderSide: BorderSide(color: Colors.red),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: Colors.red),
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter your password';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ],
                          ),

                          SizedBox(height: 16),

                          // Remember me and Forgot Password row
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                    height: 24,
                                    width: 24,
                                    child: Checkbox(
                                      value: _rememberMe,
                                      onChanged: (value) {
                                        setState(() {
                                          _rememberMe = value ?? false;
                                        });
                                      },
                                      activeColor: const Color(0xFFE41F1F),
                                    ),
                                  ),
                                  SizedBox(width: 8),
                                  Text(
                                    'Remember me',
                                    style: TextStyle(
                                      fontSize: isSmallScreen ? 12 : 14,
                                    ),
                                  ),
                                ],
                              ),
                              GestureDetector(
                                onTap: _showForgotPasswordDialog,
                                child: Text(
                                  'Forgot Password?',
                                  style: TextStyle(
                                    fontSize: isSmallScreen ? 12 : 14,
                                    color: const Color(0xFFE41F1F),
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ],
                          ),

                          SizedBox(height: size.height * 0.04),

                          // Login button
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: _handleLogin,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFFE41F1F),
                                foregroundColor: Colors.white,
                                padding: EdgeInsets.symmetric(vertical: 12),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                              child: Text(
                                'Login',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),

                          SizedBox(height: size.height * 0.04),

                          // Sign up text
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Do not have an account? ',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black87,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  // Navigate to sign up page using Go Router
                                  context.go('/create-account');
                                },
                                child: Text(
                                  'Sign Up',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: const Color(0xFFE41F1F),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class OvalBackgroundPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Create a red background
    Paint redPaint = Paint()..color = const Color(0xFFE41F1F);
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), redPaint);

    // Create white oval/blob shapes that create the spill effect
    Paint whitePaint = Paint()..color = Colors.white;

    // Main large oval shape at the bottom center
    final centerX = size.width / 2;
    final bottomY = size.height;
    final mainOvalRect = Rect.fromCenter(
      center: Offset(centerX, bottomY),
      width: size.width * 1.4,
      height: size.height * 1.4,
    );
    canvas.drawOval(mainOvalRect, whitePaint);

    // Secondary oval shape on the right side for additional effect
    final rightOvalRect = Rect.fromCenter(
      center: Offset(size.width + 20, size.height * 0.6),
      width: size.width * 0.5,
      height: size.height * 0.8,
    );
    canvas.drawOval(rightOvalRect, whitePaint);

    // Left side oval for better symmetry
    final leftOvalRect = Rect.fromCenter(
      center: Offset(-20, size.height * 0.6),
      width: size.width * 0.5,
      height: size.height * 0.8,
    );
    canvas.drawOval(leftOvalRect, whitePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
