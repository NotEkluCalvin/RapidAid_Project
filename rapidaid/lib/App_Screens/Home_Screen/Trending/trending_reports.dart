import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rapidaidv2/App_Components/App_Style/colors.dart';
import 'package:rapidaidv2/App_Functions/Reports/report_function.dart';

class TrendingReports extends StatelessWidget {
  const TrendingReports({super.key});

  @override
  Widget build(BuildContext context) {
    final trendingReports =
        Provider.of<ReportFunction>(context).topTrendingReports;

    return Center(
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
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.file(
                            height: 125,
                            width: 125,
                            File(report.imagePath),
                            fit: BoxFit.cover,
                          ),
                        ),
                        Expanded(
                          child: ListTile(
                            title: Text(
                              report.message,
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                            ),
                            subtitle: Text(
                              'Reported From ${report.address ?? 'No location available'}',
                              style: TextStyle(
                                fontSize: 10,
                                color: Colors.grey,
                              ),
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



// child: Container(
                          //   height: 125,
                          //   width: 125,
                          //   color: Colors.white,
                          // ),