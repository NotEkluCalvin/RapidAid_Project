import 'package:flutter/material.dart';
import 'package:rapidaidv2/App_Screens/Profile_Screen/Profile_Screen_widgets/user_display.dart';
import 'package:rapidaidv2/App_Screens/Welcome_Screen/welcome_screen.dart';
import 'package:unicons/unicons.dart';

import 'Profile_Screen_widgets/options.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('username'),
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(UniconsLine.estate),
          ),
        ),
        body: ListView(
          children: [
            UserDisplayWidget(),
            ListTile(title: Text('O P T I O N S')),
            OptionsWidget(),
            // Spacer(),
            ListTile(
              title: const Text('L O G O U T'),
              textColor: Colors.red,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => WelcomeScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
