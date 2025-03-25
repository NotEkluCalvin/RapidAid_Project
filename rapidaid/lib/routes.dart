import 'package:rapidaid/screens/chat_screen.dart';
import 'package:rapidaid/screens/editprofile_screen.dart';
import 'package:rapidaid/screens/home_screen.dart';
import 'package:rapidaid/screens/map_screen.dart';
import 'package:rapidaid/screens/profile_screen.dart';
import 'package:rapidaid/screens/updates_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/home':
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case '/map':
        return MaterialPageRoute(builder: (_) => const MapScreen());
      case '/updates':
        return MaterialPageRoute(builder: (_) => const UpdatesScreen());
      case '/chat':
        return MaterialPageRoute(builder: (_) => const ChatScreen());
      case '/profile':
        return MaterialPageRoute(builder: (_) => const ProfileScreen());
      case '/edit_profile':
        return MaterialPageRoute(builder: (_) => const EditProfileScreen());
      default:
        return MaterialPageRoute(
          builder:
              (_) => Scaffold(
                body: Center(
                  child: Text('No route defined for ${settings.name}'),
                ),
              ),
        );
    }
  }
}
