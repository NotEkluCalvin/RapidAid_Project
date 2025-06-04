import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:rapidaidv2/App_Functions/Reports/report_model.dart';

List<Marker> buildReportMarkers() {
   List<ReportModel> reports = [];
  return reports
      .where((r) => r.location != null)
      .map(
        (r) => Marker(
          point: r.location!,
          width: 30,
          height: 30,
          rotate: false,
          child:  const Icon(
                Icons.report_problem,
                color: Colors.deepOrange,
                size: 30,
              ),
        ),
      )
      .toList();
}
