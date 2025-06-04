import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:provider/provider.dart';
import 'package:rapidaidv2/App_Components/Theme/theme_provider.dart';
import 'package:rapidaidv2/App_Functions/Map_Logic/map_location.dart';
import 'package:rapidaidv2/App_Functions/Reports/report_function.dart';
import 'package:rapidaidv2/App_Screens/Welcome_Screen/splash_screen.dart';

import 'App_Functions/add_emergency_contact.dart';

List<CameraDescription>? cameras;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
        ChangeNotifierProvider(create: (context) => AddEmergencyContact()),
        ChangeNotifierProvider(create: (context) => ReportFunction()),
        ChangeNotifierProvider(create: (context) => LocationProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: Provider.of<ThemeProvider>(context).themeData,
      home: SplashScreen(),
    );
  }
}

/*import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';
import 'package:rapidaidv2/App_Screens/Authentication/Login_Screen/login_screen.dart';
import 'package:rapidaidv2/App_Screens/Home_Screen/home_screen.dart';
import 'package:rapidaidv2/providers/user_provider.dart';
import 'package:rapidaidv2/App_Components/App_Style/colors.dart';
import 'package:camera/camera.dart';
import 'package:rapidaidv2/providers/location_provider.dart';
import 'package:rapidaidv2/App_Components/App_Navigation/navigation.dart';

List<CameraDescription>? cameras;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  cameras = await availableCameras();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<LocationProvider>(
          create: (_) => LocationProvider(),
        ),
        ChangeNotifierProvider<UserProvider>(create: (_) => UserProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'RapidAid',
        theme: ThemeData(
          primaryColor: myMainColor,
          colorScheme: ColorScheme.fromSwatch().copyWith(secondary: myAltColor),
        ),
        home: const AppEntryPoint(),
        //home: const AppNavigation(),
      ),
    );
  }
}

class AppEntryPoint extends StatelessWidget {
  const AppEntryPoint({super.key});

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);

    return FutureBuilder(
      future: userProvider.loadUserData(), // Try to load user from Firebase
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        } else {
          // If user is logged in and data is loaded, go to Home
          return userProvider.user != null
              ? const HomeScreen()
              : const LoginScreen();
        }
      },
    );
  }
}*/
