import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rapidaidv2/App_Components/App_Style/colors.dart';
import 'package:rapidaidv2/App_Functions/add_emergency_contact.dart';
import 'package:unicons/unicons.dart';

import 'add_emergency_contact_form.dart';

class EmergencyContactsScreen extends StatefulWidget {
  const EmergencyContactsScreen({super.key});

  @override
  State<EmergencyContactsScreen> createState() =>
      _EmergencyContactsScreenState();
}

class _EmergencyContactsScreenState extends State<EmergencyContactsScreen> {
  final _formKey = GlobalKey<FormState>();
  final Set<int> _expandedIndexes = {};
  @override
  Widget build(BuildContext context) {
    final addEmergencyContact = Provider.of<AddEmergencyContact>(context);
    final contacts = addEmergencyContact.allEmergencyContacts;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(150),
        child: AppBar(
          backgroundColor: myMainColor,
          automaticallyImplyLeading: false,
          flexibleSpace: SafeArea(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(UniconsLine.phone, size: 40, color: Colors.white),
                  SizedBox(height: 8),
                  Text(
                    'EMERGENCY CONTACTS',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      letterSpacing: 1.2,
                    ),
                  ),
                ],
              ),
            ),
          ),
          leading: IconButton(
            icon: const Icon(UniconsLine.estate, color: Colors.white),
            onPressed: () => Navigator.pop(context),
          ),
        ),
      ),
      body:
          contacts.isEmpty
              ? Center(child: Text("No emergency contacts yet."))
              : ListView.builder(
                itemCount: contacts.length,
                itemBuilder: (context, index) {
                  final contact = contacts[index];
                  final isExpanded = _expandedIndexes.contains(index);
                  return Column(
                    children: [
                      Card(
                        elevation: 4,
                        margin: const EdgeInsets.symmetric(
                          vertical: 8,
                          horizontal: 16,
                        ),
                        color: myAltColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                          side: const BorderSide(color: myMainColor),
                        ),
                        child: ListTile(
                          leading: const Icon(
                            UniconsLine.user,
                            color: Colors.black87,
                          ),
                          title: Text(
                            contact['name'],
                            style: const TextStyle(fontWeight: FontWeight.w600),
                          ),
                          subtitle: Text(contact['contact']),
                          trailing: IconButton(
                            icon: const Icon(Icons.call, color: Colors.green),
                            onPressed: () {
                              // Call functionality
                            },
                            onLongPress: () {
                              setState(() {
                                if (isExpanded) {
                                  _expandedIndexes.remove(index);
                                } else {
                                  _expandedIndexes.add(index);
                                }
                              });
                            },
                          ),
                        ),
                      ),
                      AnimatedCrossFade(
                        duration: const Duration(milliseconds: 300),
                        crossFadeState:
                            isExpanded
                                ? CrossFadeState.showFirst
                                : CrossFadeState.showSecond,
                        firstChild: Padding(
                          padding: const EdgeInsets.only(
                            left: 16,
                            right: 16,
                            bottom: 12,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              TextButton(
                                onPressed: () {
                                  // Handle edit
                                },
                                child: const Text(
                                  'Edit',
                                  style: TextStyle(color: Colors.blue),
                                ),
                              ),
                              const SizedBox(width: 8),
                              TextButton(
                                onPressed: () {
                                  setState(() {
                                    _expandedIndexes.remove(index);
                                  });
                                },
                                child: const Text('Cancel'),
                              ),
                            ],
                          ),
                        ),
                        secondChild: const SizedBox.shrink(),
                      ),
                      // if (isExpanded)
                      //   Padding(
                      //     padding: const EdgeInsets.only(right: 16),
                      //     child: Row(
                      //       mainAxisAlignment: MainAxisAlignment.end,
                      //       children: <Widget>[
                      //         TextButton(
                      //           onPressed: () {
                      //             // Edit action
                      //           },
                      //           child: const Text(
                      //             'Edit',
                      //             style: TextStyle(color: Colors.blue),
                      //           ),
                      //         ),
                      //         const SizedBox(width: 8),
                      //         TextButton(
                      //           onPressed: () {
                      //             setState(() {
                      //               _expandedIndexes.remove(index);
                      //             });
                      //           },
                      //           child: const Text('Cancel'),
                      //         ),
                      //         const SizedBox(width: 8),
                      //       ],
                      //     ),
                      //   ),
                    ],
                  );
                },
              ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: myAltColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        onPressed: () {
          showDialog<String>(
            context: context,
            builder:
                (BuildContext context) => AlertDialog(
                  title: const Text('Add contact'),
                  actions: <Widget>[
                    AddEmergencyContactForm(
                      formKey: _formKey,
                      addEmergencyContact: addEmergencyContact,
                    ),
                  ],
                ),
          );
        },
        tooltip: 'Add contact',
        child: Icon(Icons.subtitles, color: myMainColor),
      ),
    );
  }
}
