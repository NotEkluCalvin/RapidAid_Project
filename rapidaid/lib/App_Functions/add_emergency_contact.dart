import 'package:flutter/material.dart';

class AddEmergencyContact with ChangeNotifier {
  final List<Map<String, dynamic>> _emergencycontacts = [];

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _contactController = TextEditingController();

  TextEditingController get nameController => _nameController;
  TextEditingController get contactController => _contactController;

  List<Map<String, dynamic>> get allEmergencyContacts => _emergencycontacts;

  bool addEmergencyContact(BuildContext context) {
    final name = _nameController.text.trim();
    final contact = _contactController.text.trim();

    if (name.isEmpty || contact.isEmpty) {
      return false;
    }
    
    _emergencycontacts.add({'name': name, 'contact': contact});

    _nameController.clear();
    _contactController.clear();
    notifyListeners();
    return true;
  }
}
