// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import '../screens/create_account_screen.dart';
// import '../screens/password_screen.dart';
// import '../screens/login_screen.dart';

// class AppRouter {
//   static final GoRouter router = GoRouter(
//     initialLocation: '/create-account',
//     routes: [
//       GoRoute(
//         path: '/create-account',
//         builder: (context, state) => const CreateAccountScreen(),
//       ),
//       GoRoute(
//         path: '/password',
//         builder: (context, state) {
//           final params = state.uri.queryParameters;
//           return PasswordScreen(
//             username: params['username'] ?? '',
//             dateOfBirth: params['dateOfBirth'] ?? '',
//             phoneOrEmail: params['phoneOrEmail'] ?? '',
//           );
//         },
//       ),
//       GoRoute(path: '/login', builder: (context, state) => const LoginScreen()),
//     ],
//     errorBuilder:
//         (context, state) => Scaffold(
//           body: Center(child: Text('Route not found: ${state.uri.path}')),
//         ),
//   );
// }

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:camera/camera.dart';
import 'screens/create_account_screen.dart';
import 'screens/password_screen.dart';
import 'screens/login_screen.dart';
import 'screens/welcome_screen.dart';
import 'screens/home_screen.dart';
import 'screens/map_screen.dart';
import 'screens/camera_screen.dart';
import 'screens/chat_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/editprofile_screen.dart';
import 'screens/updates_screen.dart';

class AppRouter {
  static GoRouter configureRouter(List<CameraDescription> cameras) {
    // This would typically be determined by checking authentication state
    // For now, setting this to false to show welcome screen first
    bool isLoggedIn = false;

    return GoRouter(
      initialLocation: isLoggedIn ? '/home' : '/',
      routes: [
        // Authentication Screens
        GoRoute(path: '/', builder: (context, state) => const WelcomeScreen()),
        GoRoute(
          path: '/login',
          builder: (context, state) => const LoginScreen(),
        ),
        GoRoute(
          path: '/create-account',
          builder: (context, state) => const CreateAccountScreen(),
        ),
        GoRoute(
          path: '/password',
          builder: (context, state) {
            final params = state.uri.queryParameters;
            return PasswordScreen(
              username: params['username'] ?? '',
              dateOfBirth: params['dateOfBirth'] ?? '',
              phoneOrEmail: params['phoneOrEmail'] ?? '',
            );
          },
        ),

        // Main App Screens
        GoRoute(path: '/home', builder: (context, state) => const HomeScreen()),
        GoRoute(path: '/map', builder: (context, state) => const MapScreen()),
        GoRoute(
          path: '/camera',
          builder: (context, state) => CameraScreen(cameras: cameras),
        ),
        GoRoute(path: '/chat', builder: (context, state) => const ChatScreen()),
        GoRoute(
          path: '/profile',
          builder: (context, state) => const ProfileScreen(),
        ),
        GoRoute(
          path: '/edit_profile',
          builder: (context, state) => const EditProfileScreen(),
        ),
        GoRoute(
          path: '/updates',
          builder: (context, state) => const UpdatesScreen(),
        ),
      ],
      errorBuilder:
          (context, state) => Scaffold(
            body: Center(child: Text('Route not found: ${state.uri.path}')),
          ),
    );
  }
}
