import 'package:firebase_core/firebase_core.dart';
import 'package:rapidaid/screens/chat_screen.dart';
import 'package:rapidaid/screens/editprofile_screen.dart';
import 'package:rapidaid/screens/home_screen.dart';
import 'package:rapidaid/screens/map_screen.dart';
import 'package:rapidaid/screens/profile_screen.dart';
import 'package:rapidaid/screens/updates_screen.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'app_router.dart';
import 'bloc/auth/auth_bloc.dart';
import 'repositories/auth_repository.dart';
import 'package:camera/camera.dart';
import 'package:image_picker/image_picker.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

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
