import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:rapidaidv2/App_Screens/Reported_Incidents/Reported_Incidents_Widgets/comments_list.dart';

void commentSheet(BuildContext context, int index) {
  showCupertinoModalBottomSheet(
    
    elevation: 5,
    context: context,
    builder: (context) {
      return AspectRatio(
        aspectRatio: 4 / 5,
        child: CommentsList(reportIndex: index),
      );
    },
  );
}
