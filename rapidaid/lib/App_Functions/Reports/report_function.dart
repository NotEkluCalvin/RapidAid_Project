import 'package:flutter/material.dart';
import 'package:rapidaidv2/App_Functions/Reports/report_model.dart';

class ReportFunction with ChangeNotifier {
  final List<ReportModel> _reports = [];

  List<ReportModel> get reports {
    final sortedReports = [..._reports];
    sortedReports.sort((a, b) => b.createdAt.compareTo(a.createdAt));
    return sortedReports;
  }

    List<ReportModel> get topTrendingReports {
    final sorted = [..._reports];
    sorted.sort((a, b) => b.comments.length.compareTo(a.comments.length));
    return sorted.take(3).toList();
  }

  void addReport(ReportModel report) {
    _reports.add(report);
    notifyListeners();
  }

  void updateReportComments(String reportId, List<ReportComments> newComments) {
  final reportIndex = _reports.indexWhere((report) => report.id == reportId);
  if (reportIndex == -1) return;

  newComments.sort((a, b) => b.createdAt.compareTo(a.createdAt));
  _reports[reportIndex] = _reports[reportIndex].copyWith(comments: newComments);
  notifyListeners();
}

}

 


// List<ReportModel> get reports => _reports;

// List<ReportModel> get reports {
  //   final sortedReports = [..._reports];
  //   sortedReports.sort((a, b) => b.createdAt.compareTo(a.createdAt));
  //   return sortedReports;
  // }

 // void updateReportComments(int index, List<ReportComments> newComments) {
  //   newComments.sort((a, b) => b.createdAt.compareTo(a.createdAt));
  //   _reports[index] = _reports[index].copyWith(comments: newComments);
  //   notifyListeners();
  // }