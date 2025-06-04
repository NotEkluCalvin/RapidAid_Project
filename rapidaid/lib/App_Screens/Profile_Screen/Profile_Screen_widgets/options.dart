import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rapidaidv2/App_Components/App_Widgets/custom_button.dart';
import 'package:rapidaidv2/App_Components/App_Widgets/custom_text_field.dart';
import 'package:rapidaidv2/App_Components/Theme/theme_toggle.dart';
import 'package:rapidaidv2/App_Functions/add_emergency_contact.dart';
import 'package:unicons/unicons.dart';

class OptionsWidget extends StatefulWidget {
  const OptionsWidget({super.key});

  @override
  State<OptionsWidget> createState() => _OptionsWidgetState();
}

class _OptionsWidgetState extends State<OptionsWidget> {
  // final _formKey = GlobalKey<FormState>();
  bool _isExpandedPassword = false;
  bool _isExpandedUserName = false;

  @override
  Widget build(BuildContext context) {
    Provider.of<AddEmergencyContact>(context);
    return Card(
      child: Column(
        children: [
          // change username
          ListTile(
            onTap: () {
              setState(() {
                _isExpandedUserName = !_isExpandedUserName;
              });
            },
            leading: const Icon(UniconsLine.user_square),
            title: const Text('c h a n g e  u s e r n a m e'),
            trailing: Icon(
              _isExpandedUserName
                  ? Icons.keyboard_arrow_up
                  : Icons.keyboard_arrow_down,
            ),
          ),
          if (_isExpandedUserName)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  CustomTextField(hinttext: 'new username'),
                  SizedBox(height: 10),
                  MyCardButton(
                    text: 'change username',
                    onPressed: () {
                      setState(() {
                        _isExpandedUserName = !_isExpandedUserName;
                      });
                    },
                  ),
                ],
              ),
            ),
          // password change
          ListTile(
            onTap: () {
              setState(() {
                _isExpandedPassword = !_isExpandedPassword;
              });
            },
            leading: const Icon(UniconsLine.lock_access),
            title: const Text('c h a n g e  p a s s w o r d'),
            trailing: Icon(
              _isExpandedPassword
                  ? Icons.keyboard_arrow_up
                  : Icons.keyboard_arrow_down,
            ),
          ),
          if (_isExpandedPassword)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  CustomTextField(hinttext: 'old password'),
                  CustomTextField(hinttext: 'new password'),
                  CustomTextField(
                    hinttext: 'confirm new password',
                    onTap: () {},
                  ),
                  SizedBox(height: 10),
                  MyCardButton(
                    text: 'change password',
                    onPressed: () {
                      setState(() {
                        _isExpandedPassword = !_isExpandedPassword;
                      });
                    },
                  ),
                ],
              ),
            ),

          // Add emergency contact
          const ThemeToggle(),
        ],
      ),
    );
  }
}
