// main.dart
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // Get available cameras for later use
  final cameras = await availableCameras();

  // Pass cameras to the app
  runApp(RapidAidApp(cameras: cameras));
}

class RapidAidApp extends StatelessWidget {
  final List<CameraDescription> cameras;

  const RapidAidApp({super.key, required this.cameras});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'RapidAid',
      theme: ThemeData(
        primaryColor: const Color(0xFFE51C23),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: const Color(0xFFE51C23),
          secondary: const Color(0xFFE51C23),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFFE51C23),
          foregroundColor: Colors.white,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFE51C23),
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            padding: const EdgeInsets.symmetric(vertical: 12),
          ),
        ),
      ),
      routerConfig: AppRouter.configureRouter(cameras),
      debugShowCheckedModeBanner: false,
    );
  }
}
