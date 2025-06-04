import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rapidaidv2/App_Components/App_Style/colors.dart';
import 'package:rapidaidv2/App_Functions/Reports/dateformat.dart';
import 'package:rapidaidv2/App_Functions/Reports/report_function.dart';
import 'package:rapidaidv2/App_Screens/Reported_Incidents/Reported_Incidents_Widgets/comments_sheet.dart';
import 'package:unicons/unicons.dart';

class ReportedIncidentsList extends StatelessWidget {
  const ReportedIncidentsList({super.key});

  @override
  Widget build(BuildContext context) {
    final reports = Provider.of<ReportFunction>(context).reports;

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
                children: [
                  Icon(UniconsLine.medkit, size: 40, color: Colors.white),
                  SizedBox(height: 8),
                  Text(
                    'REPORTED INCIDENTS',
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
        ),
      ),
      body:
          reports.isEmpty
              ? Center(child: Text('No Current Reports'))
              : ListView.builder(
                itemCount: reports.length,
                itemBuilder: (context, index) {
                  final report = reports[index];
                  return Card(
                    margin: EdgeInsets.all(12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    shadowColor: myMainColor,
                    elevation: 4,
                    clipBehavior: Clip.antiAlias,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                          child: Text(
                            'Reported From ${report.address ?? 'No location available'}',
                          ),
                        ),
                        AspectRatio(
                          aspectRatio: 5 / 6,

                          child: Image.file(
                            File(report.imagePath),
                            fit: BoxFit.fill,
                          ),
                        ),
                        ListTile(
                          title: Text(
                            report.message,
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Text(
                            'Reported ${formatDate(report.createdAt)}',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.normal,
                              color: Colors.blueGrey,
                            ),
                          ),
                          trailing: IconButton(
                            onPressed: () {
                              commentSheet(context, index);
                            },
                            icon: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(UniconsLine.comment_message),
                                Text(report.comments.length.toString()),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
    );
  }
}
