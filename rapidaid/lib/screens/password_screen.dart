import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../bloc/auth/auth_bloc.dart';
import '../bloc/auth/auth_state.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/custom_button.dart';

class PasswordScreen extends StatefulWidget {
  final String username;
  final String dateOfBirth;
  final String phoneOrEmail;

  const PasswordScreen({
    super.key,
    required this.username,
    required this.dateOfBirth,
    required this.phoneOrEmail,
  });

  @override
  State<PasswordScreen> createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Get screen size for responsive design
    final size = MediaQuery.of(context).size;
    final isSmallScreen = size.width < 360;

    return Scaffold(
      backgroundColor: const Color(0xFFE41F1F),
      body: SafeArea(
        child: BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is AuthSuccess) {
              context.go('/login');
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Account created successfully! Please login.'),
                  backgroundColor: Colors.green,
                ),
              );
            } else if (state is AuthFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message),
                  backgroundColor: Colors.red,
                ),
              );
            }
          },
          child: Stack(
            children: [
              // App Icons at the corners (same as create account screen)
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
              Positioned(
                top: size.height * 0.15,
                left: 16,
                child: Icon(
                  Icons.help_outline,
                  color: Colors.white,
                  size: isSmallScreen ? 22 : 24,
                ),
              ),
              Positioned(
                top: size.height * 0.15,
                right: 16,
                child: Icon(
                  Icons.people,
                  color: Colors.white,
                  size: isSmallScreen ? 22 : 24,
                ),
              ),
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
              Positioned(
                bottom: size.height * 0.3,
                left: 16,
                child: Icon(
                  Icons.person,
                  color: Colors.white,
                  size: isSmallScreen ? 22 : 24,
                ),
              ),
              Positioned(
                bottom: size.height * 0.3,
                right: 16,
                child: Icon(
                  Icons.shield,
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
                            'You\'ll need a password',
                            style: TextStyle(
                              fontSize: isSmallScreen ? 20 : 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                        ),
                        SizedBox(height: 8),
                        Center(
                          child: Text(
                            'Make sure it\'s 8 characters or more.',
                            style: TextStyle(
                              fontSize: isSmallScreen ? 13 : 14,
                              color: Colors.black54,
                            ),
                          ),
                        ),
                        SizedBox(height: size.height * 0.03),
                        CustomTextField(
                          onTap: () {},
                          controller: _passwordController,
                          label: 'Password',
                          prefixIcon: Icons.lock_outline,
                          suffixIcon: IconButton(
                            icon: Icon(
                              _obscurePassword
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: Colors.grey,
                            ),
                            onPressed: () {
                              setState(() {
                                _obscurePassword = !_obscurePassword;
                              });
                            },
                          ),
                          obscureText: _obscurePassword,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a password';
                            }
                            if (value.length < 8) {
                              return 'Password must be at least 8 characters';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: size.height * 0.02),
                        CustomTextField(
                          onTap: () {},
                          controller: _confirmPasswordController,
                          label: 'Confirm Password',
                          prefixIcon: Icons.lock_outline,
                          suffixIcon: IconButton(
                            icon: Icon(
                              _obscureConfirmPassword
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: Colors.grey,
                            ),
                            onPressed: () {
                              setState(() {
                                _obscureConfirmPassword =
                                    !_obscureConfirmPassword;
                              });
                            },
                          ),
                          obscureText: _obscureConfirmPassword,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please confirm your password';
                            }
                            if (value != _passwordController.text) {
                              return 'Passwords do not match';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: size.height * 0.04),
                        BlocBuilder<AuthBloc, AuthState>(
                          builder: (context, state) {
                            return CustomButton(
                              text: 'Sign Up',
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  // Uncomment and implement when auth bloc is ready
                                  // context.read<AuthBloc>().add(
                                  //   SignUpRequested(
                                  //     username: widget.username,
                                  //     email: widget.phoneOrEmail.contains('@')
                                  //         ? widget.phoneOrEmail
                                  //         : null,
                                  //     phoneNumber: !widget.phoneOrEmail.contains('@')
                                  //         ? widget.phoneOrEmail
                                  //         : null,
                                  //     password: _passwordController.text,
                                  //     dateOfBirth: widget.dateOfBirth,
                                  //   ),
                                  // );

                                  // For now, navigate to login screen
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text(
                                        'Account created successfully! Please login.',
                                      ),
                                      backgroundColor: Colors.green,
                                    ),
                                  );
                                  context.go('/login');
                                }
                              },
                              backgroundColor: const Color(0xFFE41F1F),
                              textColor: Colors.white,
                              isLoading: state is AuthLoading,
                            );
                          },
                        ),
                        SizedBox(height: size.height * 0.02),
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
          ),
        ),
      ),
    );
  }
}
