import 'package:flutter/material.dart';
import 'package:rapidaidv2/App_Components/App_Style/colors.dart';
import 'package:rapidaidv2/App_Functions/First_Aid_Logic/first_aid_model.dart';
import 'package:unicons/unicons.dart';

class FirstAidDetail extends StatelessWidget {
  final FirstAidSituation situation;

  const FirstAidDetail({super.key, required this.situation});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(150),
        child: AppBar(
          backgroundColor: myMainColor,
          flexibleSpace: SafeArea(
            child: Center(
              child: Text(
                situation.title,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  letterSpacing: 1.2,
                ),
              ),
            ),
          ),
          leading: IconButton(
            icon: const Icon(UniconsLine.medkit, color: Colors.white),
            onPressed: () => Navigator.pop(context),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.separated(
          itemCount: situation.steps.length,
          separatorBuilder: (_, __) => const SizedBox(height: 12),
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Icon(
                  //   Icons.check_circle_outline,
                  //   color: Colors.green,
                  //   size: 20,
                  // ),
                  Text(
                    "${index + 1}. ",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.redAccent,
                    ),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      situation.steps[index],
                      style: const TextStyle(fontSize: 16, height: 1.4),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
