import 'package:flutter/material.dart';
import 'package:rapidaidv2/App_Components/App_Style/colors.dart';
import 'package:unicons/unicons.dart';

class ReportEmergency extends StatelessWidget {
  const ReportEmergency({super.key});

  @override
  Widget build(BuildContext context) {
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
                  Icon(
                    UniconsLine.exclamation_triangle,
                    size: 40,
                    color: Colors.white,
                  ),
                  SizedBox(height: 8),
                  Text(
                    'EMERGENCY SERVICES',
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
      body: ListView(
        children: [
          ListTile(title: Text('CALL POLICE'), trailing: Text('911')),
          Divider(indent: 15, endIndent: 15),
          ListTile(title: Text('CALL FIRESERVICE'), trailing: Text('911')),
          Divider(indent: 15, endIndent: 15),
          ListTile(title: Text('CALL AMBULANCE'), trailing: Text('911')),
          Divider(indent: 15, endIndent: 15),
        ],
      ),
    );
  }
}
