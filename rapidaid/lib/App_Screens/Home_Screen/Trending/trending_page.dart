import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rapidaidv2/App_Components/App_Style/colors.dart';
import 'package:rapidaidv2/App_Functions/Reports/dateformat.dart';
import 'package:rapidaidv2/App_Functions/Reports/report_function.dart';
import 'package:unicons/unicons.dart';

class TrendingPage extends StatelessWidget {
  const TrendingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final trendingReports =
        Provider.of<ReportFunction>(context).topTrendingReports;
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
                    'TRENDING REPORTS',
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
      body: Center(
        child:
            trendingReports.isEmpty
                ? const Center(child: Text('No trending reports yet.'))
                : ListView.builder(
                  itemCount: trendingReports.length,
                  itemBuilder: (context, index) {
                    final report = trendingReports[index];
                    return Card(
                      margin: const EdgeInsets.all(12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      shadowColor: myMainColor,
                      elevation: 4,
                      clipBehavior: Clip.antiAlias,
                      child: Column(
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
                          Expanded(
                            child: ListTile(
                              title: Text(report.message),
                              subtitle: Text(
                                'Reported ${formatDate(report.createdAt)}',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.blueGrey,
                                ),
                              ),
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
