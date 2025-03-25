// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:go_router/go_router.dart';
// import '../bloc/form/form_bloc.dart';
// import '../widgets/custom_text_field.dart';
// import '../widgets/custom_button.dart';
// import '../bloc/form/form_state.dart';

// class CreateAccountScreen extends StatefulWidget {
//   const CreateAccountScreen({super.key});

//   @override
//   State<CreateAccountScreen> createState() => _CreateAccountScreenState();
// }

// class _CreateAccountScreenState extends State<CreateAccountScreen> {
//   final _formKey = GlobalKey<FormState>();
//   final _usernameController = TextEditingController();
//   final _dateOfBirthController = TextEditingController();
//   final _phoneOrEmailController = TextEditingController();
//   late FormBloc _formBloc;

//   @override
//   void initState() {
//     super.initState();
//     _formBloc = FormBloc();
//   }

//   @override
//   void dispose() {
//     _usernameController.dispose();
//     _dateOfBirthController.dispose();
//     _phoneOrEmailController.dispose();
//     _formBloc.close();
//     super.dispose();
//   }

//   Future<void> _selectDate() async {
//     final DateTime? picked = await showDatePicker(
//       context: context,
//       initialDate: DateTime.now().subtract(
//         const Duration(days: 365 * 18),
//       ), // Default to 18 years ago
//       firstDate: DateTime(1900),
//       lastDate: DateTime.now(),
//       builder: (context, child) {
//         return Theme(
//           data: ThemeData.light().copyWith(
//             colorScheme: const ColorScheme.light(
//               primary: Color(0xFFE41F1F),
//               onPrimary: Colors.white,
//             ),
//             dialogBackgroundColor: Colors.white,
//           ),
//           child: child!,
//         );
//       },
//     );

//     if (picked != null) {
//       setState(() {
//         _dateOfBirthController.text =
//             "${picked.day}/${picked.month}/${picked.year}";
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     // Get screen size for responsive design
//     final size = MediaQuery.of(context).size;
//     final isSmallScreen = size.width < 360;

//     return Scaffold(
//       backgroundColor: const Color(0xFFE41F1F),
//       body: SafeArea(
//         child: BlocProvider(
//           create: (context) => _formBloc,
//           child: BlocBuilder<FormBloc, FormValidationState>(
//             builder: (context, state) {
//               return Stack(
//                 children: [
//                   // App Icons at the corners
//                   Positioned(
//                     top: 16,
//                     left: 16,
//                     child: Icon(
//                       Icons.directions_car,
//                       color: Colors.white,
//                       size: isSmallScreen ? 22 : 24,
//                     ),
//                   ),
//                   Positioned(
//                     top: 16,
//                     right: 16,
//                     child: Icon(
//                       Icons.medical_services,
//                       color: Colors.white,
//                       size: isSmallScreen ? 22 : 24,
//                     ),
//                   ),
//                   Positioned(
//                     top: 16,
//                     right: size.width * 0.5 - 12,
//                     child: Icon(
//                       Icons.call,
//                       color: Colors.white,
//                       size: isSmallScreen ? 22 : 24,
//                     ),
//                   ),
//                   Positioned(
//                     top: size.height * 0.15,
//                     left: 16,
//                     child: Icon(
//                       Icons.help_outline,
//                       color: Colors.white,
//                       size: isSmallScreen ? 22 : 24,
//                     ),
//                   ),
//                   Positioned(
//                     top: size.height * 0.15,
//                     right: 16,
//                     child: Icon(
//                       Icons.people,
//                       color: Colors.white,
//                       size: isSmallScreen ? 22 : 24,
//                     ),
//                   ),
//                   Positioned(
//                     bottom: 16,
//                     left: 16,
//                     child: Icon(
//                       Icons.location_on,
//                       color: Colors.white,
//                       size: isSmallScreen ? 22 : 24,
//                     ),
//                   ),
//                   Positioned(
//                     bottom: 16,
//                     right: 16,
//                     child: Icon(
//                       Icons.notifications,
//                       color: Colors.white,
//                       size: isSmallScreen ? 22 : 24,
//                     ),
//                   ),
//                   Positioned(
//                     bottom: size.height * 0.3,
//                     left: 16,
//                     child: Icon(
//                       Icons.person,
//                       color: Colors.white,
//                       size: isSmallScreen ? 22 : 24,
//                     ),
//                   ),
//                   Positioned(
//                     bottom: size.height * 0.3,
//                     right: 16,
//                     child: Icon(
//                       Icons.shield,
//                       color: Colors.white,
//                       size: isSmallScreen ? 22 : 24,
//                     ),
//                   ),

//                   // Main content
//                   Center(
//                     child: Container(
//                       margin: EdgeInsets.symmetric(
//                         horizontal: size.width * 0.08,
//                         vertical: size.height * 0.05,
//                       ),
//                       padding: EdgeInsets.all(size.width * 0.05),
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(20),
//                       ),
//                       child: Form(
//                         key: _formKey,
//                         child: Column(
//                           mainAxisSize: MainAxisSize.min,
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Center(
//                               child: Text(
//                                 'Create your account',
//                                 style: TextStyle(
//                                   fontSize: isSmallScreen ? 20 : 22,
//                                   fontWeight: FontWeight.bold,
//                                   color: Colors.black87,
//                                 ),
//                               ),
//                             ),
//                             SizedBox(height: size.height * 0.03),
//                             CustomTextField(
//                               onTap: () {},
//                               controller: _usernameController,
//                               label: 'Username',
//                               prefixIcon: Icons.person_outline,
//                               validator: (value) {
//                                 if (value == null || value.isEmpty) {
//                                   return 'Please enter a username';
//                                 }
//                                 return null;
//                               },
//                             ),
//                             SizedBox(height: size.height * 0.02),
//                             CustomTextField(
//                               controller: _dateOfBirthController,
//                               label: 'Date of Birth',
//                               prefixIcon: Icons.calendar_today_outlined,
//                               readOnly: true,
//                               onTap: _selectDate,
//                               validator: (value) {
//                                 if (value == null || value.isEmpty) {
//                                   return 'Please select your date of birth';
//                                 }
//                                 return null;
//                               },
//                             ),
//                             SizedBox(height: size.height * 0.02),
//                             CustomTextField(
//                               onTap: () {},
//                               controller: _phoneOrEmailController,
//                               label: 'Phone number or email',
//                               prefixIcon: Icons.email_outlined,
//                               keyboardType: TextInputType.emailAddress,
//                               validator: (value) {
//                                 if (value == null || value.isEmpty) {
//                                   return 'Please enter phone or email';
//                                 }
//                                 // Simple regex for email validation
//                                 final bool isEmail = RegExp(
//                                   r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
//                                 ).hasMatch(value);
//                                 // Simple regex for phone validation
//                                 final bool isPhone = RegExp(
//                                   r'^\+?[0-9]{10,15}$',
//                                 ).hasMatch(value);

//                                 if (!isEmail && !isPhone) {
//                                   return 'Enter a valid email or phone number';
//                                 }
//                                 return null;
//                               },
//                             ),
//                             SizedBox(height: size.height * 0.04),
//                             CustomButton(
//                               text: 'Next',
//                               onPressed: () {
//                                 if (_formKey.currentState!.validate()) {
//                                   // Create a query string with parameters
//                                   final queryString =
//                                       Uri(
//                                         queryParameters: {
//                                           'username': _usernameController.text,
//                                           'dateOfBirth':
//                                               _dateOfBirthController.text,
//                                           'phoneOrEmail':
//                                               _phoneOrEmailController.text,
//                                         },
//                                       ).query;

//                                   // Navigate with the query string appended to the path
//                                   context.go('/password?$queryString');
//                                 }
//                               },
//                               backgroundColor: const Color(0xFFE41F1F),
//                               textColor: Colors.white,
//                             ),
//                             SizedBox(height: size.height * 0.02),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 Text(
//                                   'Already have an account? ',
//                                   style: TextStyle(
//                                     fontSize: isSmallScreen ? 13 : 14,
//                                     color: Colors.black87,
//                                   ),
//                                 ),
//                                 GestureDetector(
//                                   onTap: () => context.go('/login'),
//                                   child: Text(
//                                     'Login here',
//                                     style: TextStyle(
//                                       fontSize: isSmallScreen ? 13 : 14,
//                                       color: const Color(0xFFE41F1F),
//                                       fontWeight: FontWeight.bold,
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               );
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../bloc/form/form_bloc.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/custom_button.dart';
import '../bloc/form/form_state.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({super.key});

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _dateOfBirthController = TextEditingController();
  final _phoneOrEmailController = TextEditingController();
  late FormBloc _formBloc;

  @override
  void initState() {
    super.initState();
    _formBloc = FormBloc();
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _dateOfBirthController.dispose();
    _phoneOrEmailController.dispose();
    _formBloc.close();
    super.dispose();
  }

  Future<void> _selectDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now().subtract(
        const Duration(days: 365 * 18),
      ), // Default to 18 years ago
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      builder: (context, child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: const ColorScheme.light(
              primary: Color(0xFFE41F1F),
              onPrimary: Colors.white,
            ),
            dialogBackgroundColor: Colors.white,
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      setState(() {
        _dateOfBirthController.text =
            "${picked.day}/${picked.month}/${picked.year}";
      });
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
            child: BlocProvider(
              create: (context) => _formBloc,
              child: BlocBuilder<FormBloc, FormValidationState>(
                builder: (context, state) {
                  return Stack(
                    children: [
                      // Top row icons
                      Positioned(
                        top: 16,
                        left: 16,
                        child: Icon(
                          Icons.directions_car,
                          color: Colors.white,
                          size: isSmallScreen ? 22 : 24,
                        ),
                      ),
                      Positioned(
                        top: 16,
                        right: 16,
                        child: Icon(
                          Icons.medical_services,
                          color: Colors.white,
                          size: isSmallScreen ? 22 : 24,
                        ),
                      ),
                      Positioned(
                        top: 16,
                        right: size.width * 0.5 - 12,
                        child: Icon(
                          Icons.call,
                          color: Colors.white,
                          size: isSmallScreen ? 22 : 24,
                        ),
                      ),

                      // Middle row icons - adjusted positions
                      Positioned(
                        top: size.height * 0.12,
                        left: size.width * 0.12,
                        child: Icon(
                          Icons.medical_information,
                          color: Colors.white,
                          size: isSmallScreen ? 22 : 24,
                        ),
                      ),
                      Positioned(
                        top: size.height * 0.15,
                        right: size.width * 0.15,
                        child: Icon(
                          Icons.people,
                          color: Colors.white,
                          size: isSmallScreen ? 22 : 24,
                        ),
                      ),

                      // Additional icons as seen in the image
                      Positioned(
                        top: size.height * 0.25,
                        left: size.width * 0.05,
                        child: Icon(
                          Icons.person,
                          color: Colors.white,
                          size: isSmallScreen ? 22 : 24,
                        ),
                      ),
                      Positioned(
                        top: size.height * 0.3,
                        right: size.width * 0.05,
                        child: Icon(
                          Icons.shield,
                          color: Colors.white,
                          size: isSmallScreen ? 22 : 24,
                        ),
                      ),

                      // Bottom row icons
                      Positioned(
                        bottom: 16,
                        left: 16,
                        child: Icon(
                          Icons.location_on,
                          color: Colors.white,
                          size: isSmallScreen ? 22 : 24,
                        ),
                      ),
                      Positioned(
                        bottom: 16,
                        right: 16,
                        child: Icon(
                          Icons.notifications,
                          color: Colors.white,
                          size: isSmallScreen ? 22 : 24,
                        ),
                      ),

                      // Main content
                      Center(
                        child: Container(
                          margin: EdgeInsets.symmetric(
                            horizontal: size.width * 0.08,
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
                                Center(
                                  child: Text(
                                    'Create your account',
                                    style: TextStyle(
                                      fontSize: isSmallScreen ? 20 : 22,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black87,
                                    ),
                                  ),
                                ),
                                SizedBox(height: size.height * 0.03),
                                // Username field with red icon matching the image
                                Row(
                                  children: [
                                    Icon(
                                      Icons.person_outline,
                                      color: Colors.red,
                                    ),
                                    SizedBox(width: 8),
                                    Expanded(
                                      child: TextFormField(
                                        controller: _usernameController,
                                        decoration: InputDecoration(
                                          hintText: 'Username',
                                          border: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Colors.red,
                                            ),
                                          ),
                                          focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Colors.red,
                                            ),
                                          ),
                                        ),
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Please enter a username';
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: size.height * 0.02),
                                // Date of Birth field with red icon
                                Row(
                                  children: [
                                    Icon(
                                      Icons.calendar_today_outlined,
                                      color: Colors.red,
                                    ),
                                    SizedBox(width: 8),
                                    Expanded(
                                      child: TextFormField(
                                        controller: _dateOfBirthController,
                                        readOnly: true,
                                        onTap: _selectDate,
                                        decoration: InputDecoration(
                                          hintText: 'Date of Birth',
                                          border: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Colors.red,
                                            ),
                                          ),
                                          focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Colors.red,
                                            ),
                                          ),
                                        ),
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Please select your date of birth';
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: size.height * 0.02),
                                // Phone/Email field with red icon
                                Row(
                                  children: [
                                    Icon(
                                      Icons.email_outlined,
                                      color: Colors.red,
                                    ),
                                    SizedBox(width: 8),
                                    Expanded(
                                      child: TextFormField(
                                        controller: _phoneOrEmailController,
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        decoration: InputDecoration(
                                          hintText: 'Phone number or email',
                                          border: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Colors.red,
                                            ),
                                          ),
                                          focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Colors.red,
                                            ),
                                          ),
                                        ),
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Please enter phone or email';
                                          }
                                          // Simple regex for email validation
                                          final bool isEmail = RegExp(
                                            r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                                          ).hasMatch(value);
                                          // Simple regex for phone validation
                                          final bool isPhone = RegExp(
                                            r'^\+?[0-9]{10,15}$',
                                          ).hasMatch(value);

                                          if (!isEmail && !isPhone) {
                                            return 'Enter a valid email or phone number';
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: size.height * 0.04),
                                // Next button
                                SizedBox(
                                  width: double.infinity,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      if (_formKey.currentState!.validate()) {
                                        // Create a query string with parameters
                                        final queryString =
                                            Uri(
                                              queryParameters: {
                                                'username':
                                                    _usernameController.text,
                                                'dateOfBirth':
                                                    _dateOfBirthController.text,
                                                'phoneOrEmail':
                                                    _phoneOrEmailController
                                                        .text,
                                              },
                                            ).query;

                                        // Navigate with the query string appended to the path
                                        context.go('/password?$queryString');
                                      }
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color(0xFFE41F1F),
                                      foregroundColor: Colors.white,
                                      padding: EdgeInsets.symmetric(
                                        vertical: 12,
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                    ),
                                    child: Text(
                                      'Next',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: size.height * 0.02),
                                // Login link
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Already have an account? ',
                                      style: TextStyle(
                                        fontSize: isSmallScreen ? 13 : 14,
                                        color: Colors.black87,
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () => context.go('/login'),
                                      child: Text(
                                        'Login here',
                                        style: TextStyle(
                                          fontSize: isSmallScreen ? 13 : 14,
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
                  );
                },
              ),
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
