import 'package:flutter/material.dart';
import 'package:rapidaidv2/App_Components/App_Navigation/navigation.dart';
import 'package:rapidaidv2/App_Components/App_Style/colors.dart';
import 'package:rapidaidv2/App_Components/App_Widgets/custom_button.dart';
//import 'package:rapidaidv2/App_Components/App_Widgets/custom_text_field.dart';
import 'package:lottie/lottie.dart';

class PasswordRegistrationScreen extends StatefulWidget {
  const PasswordRegistrationScreen({super.key});

  @override
  State<PasswordRegistrationScreen> createState() =>
      _PasswordRegistrationScreenState();
}

class _PasswordRegistrationScreenState extends State<PasswordRegistrationScreen>
    with TickerProviderStateMixin {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  bool _passwordVisible = false;
  bool _confirmPasswordVisible = false;
  bool _success = false;

  late AnimationController _animationController;
  late Animation<double> _formFade;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    _formFade = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeIn,
    );
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  bool get _isPasswordValid {
    final password = _passwordController.text;
    return password.length >= 8 &&
        RegExp(r'[A-Z]').hasMatch(password) &&
        RegExp(r'[a-z]').hasMatch(password) &&
        RegExp(r'[0-9]').hasMatch(password) &&
        RegExp(r'[!@#\\$&*~]').hasMatch(password);
  }

  double get _passwordStrength {
    final password = _passwordController.text;
    double strength = 0;
    if (password.length >= 8) strength += 0.2;
    if (RegExp(r'[A-Z]').hasMatch(password)) strength += 0.2;
    if (RegExp(r'[a-z]').hasMatch(password)) strength += 0.2;
    if (RegExp(r'[0-9]').hasMatch(password)) strength += 0.2;
    if (RegExp(r'[!@#\\$&*~]').hasMatch(password)) strength += 0.2;
    return strength;
  }

  /*void _handleSubmit() {
    if (_isPasswordValid &&
        _passwordController.text == _confirmPasswordController.text) {
      setState(() => _success = true);
      Future.delayed(const Duration(seconds: 2), () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => AppNavigation()),
        );
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Fix errors before continuing')),
      );
    }
  }*/

  void _handleSubmit() {
    if (_isPasswordValid &&
        _passwordController.text == _confirmPasswordController.text) {
      if (_success) return; // Prevent duplicate navigation
      setState(() => _success = true);
      Future.delayed(const Duration(seconds: 2), () {
        if (mounted) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => AppNavigation()),
          );
        }
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Fix errors before continuing')),
      );
    }
  }

  Widget _buildTip(String text, bool isValid) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      transitionBuilder:
          (child, animation) =>
              FadeTransition(opacity: animation, child: child),
      child: Row(
        key: ValueKey<bool>(isValid),
        children: [
          Icon(
            isValid ? Icons.check_circle : Icons.cancel,
            color: isValid ? Colors.green : Colors.grey,
            size: 18,
          ),
          const SizedBox(width: 6),
          Text(
            text,
            style: TextStyle(color: isValid ? Colors.green : Colors.grey),
          ),
        ],
      ),
    );
  }

  Widget _buildRedHeader(Size size) {
    return Container(
      height: size.height * 0.5,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: myMainColor,
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
                child: Image.asset('assets/icons/medical_icon.png', width: 50),
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
                child: Image.asset('assets/icons/doctor_icon.png', width: 50),
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
                child: Image.asset('assets/icons/nurse_icon.png', width: 50),
              ),
              Positioned(
                bottom: height * 0.25,
                right: width * -0.025,
                child: Image.asset('assets/icons/security_icon.png', width: 50),
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
    );
  }

  InputDecoration _circularInputDecoration(
    String hint,
    bool isVisible,
    VoidCallback toggleVisibility,
  ) {
    return InputDecoration(
      hintText: hint,
      hintStyle: const TextStyle(color: Colors.grey),
      suffixIcon: IconButton(
        icon: Icon(
          isVisible ? Icons.visibility : Icons.visibility_off,
          color: Colors.grey,
        ),
        onPressed: toggleVisibility,
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.red),
        borderRadius: BorderRadius.circular(30),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.red, width: 2),
        borderRadius: BorderRadius.circular(30),
      ),
    );
  }

  /* Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          _buildRedHeader(size),

          Align(
            alignment: Alignment.center,
            child: FadeTransition(
              opacity: _formFade,
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Container(
                  margin: const EdgeInsets.only(top: 80),
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
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Text(
                          "You'll need a password",
                          style: Theme.of(context).textTheme.titleLarge
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(height: 20),
                      /* const Text(
                        'Password',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ), */
                      Row(
                        children: const [
                          Icon(Icons.lock, color: Colors.red),
                          SizedBox(width: 8),
                          Text(
                            'Password',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      const SizedBox(height: 5),
                      TextField(
                        controller: _passwordController,
                        obscureText: !_passwordVisible,
                        onChanged: (_) => setState(() {}),

                        decoration: _circularInputDecoration(
                          'Enter password',
                          _passwordVisible,
                          () {
                            setState(
                              () => _passwordVisible = !_passwordVisible,
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 10),
                      TweenAnimationBuilder<double>(
                        tween: Tween<double>(begin: 0, end: _passwordStrength),
                        duration: const Duration(milliseconds: 500),
                        builder:
                            (context, value, child) => LinearProgressIndicator(
                              value: value,
                              backgroundColor: Colors.grey[300],
                              color: value > 0.8 ? Colors.green : Colors.red,
                              minHeight: 6,
                            ),
                      ),
                      const SizedBox(height: 10),
                      _buildTip(
                        "At least 8 characters",
                        _passwordController.text.length >= 8,
                      ),
                      _buildTip(
                        "Includes uppercase letter",
                        RegExp(r'[A-Z]').hasMatch(_passwordController.text),
                      ),
                      _buildTip(
                        "Includes lowercase letter",
                        RegExp(r'[a-z]').hasMatch(_passwordController.text),
                      ),
                      _buildTip(
                        "Includes number",
                        RegExp(r'[0-9]').hasMatch(_passwordController.text),
                      ),
                      _buildTip(
                        "Includes special character",
                        RegExp(
                          r'[!@#\\$&*~]',
                        ).hasMatch(_passwordController.text),
                      ),
                      const SizedBox(height: 20),
                      /* const Text(
                        'Confirm Password',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ), */
                      Row(
                        children: const [
                          Icon(Icons.lock_outline, color: Colors.red),
                          SizedBox(width: 8),
                          Text(
                            'Confirm Password',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      const SizedBox(height: 5),
                      TextField(
                        controller: _confirmPasswordController,
                        obscureText: !_confirmPasswordVisible,
                        decoration: _circularInputDecoration(
                          'Re-enter password',
                          _confirmPasswordVisible,
                          () {
                            setState(
                              () =>
                                  _confirmPasswordVisible =
                                      !_confirmPasswordVisible,
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 30),
                      _success
                          ? Center(
                            child: Lottie.asset(
                              'assets/animations/success_tick.json',
                              height: 100,
                            ),
                          )
                          : MyCardButton(
                            text: 'Sign Up',
                            onPressed: _handleSubmit,
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
  }*/
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(), // Dismiss keyboard
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            _buildRedHeader(size),
            Align(
              alignment: Alignment.center,
              child: FadeTransition(
                opacity: _formFade,
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Container(
                    margin: const EdgeInsets.only(top: 80),
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 10,
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Text(
                            "You'll need a password",
                            style: Theme.of(context).textTheme.titleLarge
                                ?.copyWith(fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(height: 20),

                        /// Password field
                        Row(
                          children: const [
                            Icon(Icons.lock, color: Colors.red),
                            SizedBox(width: 8),
                            Text(
                              'Password',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        const SizedBox(height: 5),
                        TextField(
                          controller: _passwordController,
                          obscureText: !_passwordVisible,
                          onChanged: (_) => setState(() {}),
                          keyboardType: TextInputType.visiblePassword,
                          decoration: _circularInputDecoration(
                            'Enter password',
                            _passwordVisible,
                            () {
                              setState(
                                () => _passwordVisible = !_passwordVisible,
                              );
                            },
                          ),
                        ),
                        const SizedBox(height: 10),
                        TweenAnimationBuilder<double>(
                          tween: Tween<double>(
                            begin: 0,
                            end: _passwordStrength,
                          ),
                          duration: const Duration(milliseconds: 500),
                          builder:
                              (context, value, child) =>
                                  LinearProgressIndicator(
                                    value: value,
                                    backgroundColor: Colors.grey[300],
                                    color:
                                        value > 0.8 ? Colors.green : Colors.red,
                                    minHeight: 6,
                                  ),
                        ),
                        const SizedBox(height: 10),
                        _buildTip(
                          "At least 8 characters",
                          _passwordController.text.length >= 8,
                        ),
                        _buildTip(
                          "Includes uppercase letter",
                          RegExp(r'[A-Z]').hasMatch(_passwordController.text),
                        ),
                        _buildTip(
                          "Includes lowercase letter",
                          RegExp(r'[a-z]').hasMatch(_passwordController.text),
                        ),
                        _buildTip(
                          "Includes number",
                          RegExp(r'[0-9]').hasMatch(_passwordController.text),
                        ),
                        _buildTip(
                          "Includes special character",
                          RegExp(
                            r'[!@#\$&*~]',
                          ).hasMatch(_passwordController.text),
                        ),
                        const SizedBox(height: 20),

                        /// Confirm password
                        Row(
                          children: const [
                            Icon(Icons.lock_outline, color: Colors.red),
                            SizedBox(width: 8),
                            Text(
                              'Confirm Password',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        const SizedBox(height: 5),
                        TextField(
                          controller: _confirmPasswordController,
                          obscureText: !_confirmPasswordVisible,
                          onChanged: (_) => setState(() {}),
                          keyboardType: TextInputType.visiblePassword,
                          decoration: _circularInputDecoration(
                            'Re-enter password',
                            _confirmPasswordVisible,
                            () {
                              setState(
                                () =>
                                    _confirmPasswordVisible =
                                        !_confirmPasswordVisible,
                              );
                            },
                          ),
                        ),
                        const SizedBox(height: 10),
                        _confirmPasswordController.text.isNotEmpty
                            ? _buildTip(
                              "Passwords match",
                              _confirmPasswordController.text ==
                                  _passwordController.text,
                            )
                            : const SizedBox.shrink(),

                        const SizedBox(height: 30),
                        _success
                            ? Center(
                              child: Lottie.asset(
                                'assets/animations/success_tick.json',
                                height: 100,
                              ),
                            )
                            : MyCardButton(
                              text: 'Sign Up',
                              onPressed: _handleSubmit,
                            ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
