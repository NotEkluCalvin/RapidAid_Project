import 'package:flutter/material.dart';
import 'package:rapidaidv2/App_Components/App_Widgets/custom_button.dart';
import 'package:rapidaidv2/App_Components/App_Widgets/custom_text_field.dart';
import 'package:rapidaidv2/App_Functions/add_emergency_contact.dart';

class AddEmergencyContactForm extends StatefulWidget {
  const AddEmergencyContactForm({
    super.key,
    required GlobalKey<FormState> formKey,
    required this.addEmergencyContact,
  }) : _formKey = formKey;

  final GlobalKey<FormState> _formKey;
  final AddEmergencyContact addEmergencyContact;
  

  @override
  State<AddEmergencyContactForm> createState() =>
      _AddEmergencyContactFormState();
}

class _AddEmergencyContactFormState extends State<AddEmergencyContactForm> {
  
  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget._formKey,
      child: Column(
        children: [
          CustomTextField(
            hinttext: 'name',
            controller: widget.addEmergencyContact.nameController,
            validator:
                (value) => value == null || value.isEmpty ? 'Enter name' : null,
          ),
          CustomNumberField(
            hinttext: 'contact',
            controller: widget.addEmergencyContact.contactController,
            validator:
                (value) =>
                    value == null || value.isEmpty
                        ? 'Enter Valid contact'
                        : null,
          ),
          SizedBox(height: 10),
          MyCardButton(
            text: 'add contact',
            onPressed: () {
              if (widget._formKey.currentState!.validate()) {
                final success = widget.addEmergencyContact.addEmergencyContact(
                  context,
                );
                if (success) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Emergency Contact Added')),
                  );
                }
              }
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
