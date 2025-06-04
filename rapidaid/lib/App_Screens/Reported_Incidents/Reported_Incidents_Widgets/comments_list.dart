import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rapidaidv2/App_Components/App_Style/colors.dart';
import 'package:rapidaidv2/App_Components/App_Widgets/custom_text_field.dart';
import 'package:rapidaidv2/App_Functions/Reports/dateformat.dart';
import 'package:rapidaidv2/App_Functions/Reports/report_function.dart';
import 'package:rapidaidv2/App_Functions/Reports/report_model.dart';
import 'package:unicons/unicons.dart';
import 'package:uuid/uuid.dart';

class CommentsList extends StatefulWidget {
  final int reportIndex;
  const CommentsList({super.key, required this.reportIndex});

  @override
  State<CommentsList> createState() => _CommentsListState();
}

class _CommentsListState extends State<CommentsList> {
  final TextEditingController _commentController = TextEditingController();
  final uuid = Uuid();

  void _addComment() {
    final commentText = _commentController.text.trim();
    if (commentText.isEmpty) return;

    final reportFunction = Provider.of<ReportFunction>(context, listen: false);
    final currentReport = reportFunction.reports[widget.reportIndex];

    final updatedComments = [
      ...currentReport.comments,
      ReportComments(
        id: uuid.v4(),
        content: commentText,
        createdAt: DateTime.now(),
      ),
    ];

    reportFunction.updateReportComments(currentReport.id, updatedComments);
    _commentController.clear();
  }

  @override
  Widget build(BuildContext context) {
    final report =
        Provider.of<ReportFunction>(context).reports[widget.reportIndex];

    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 196, 194, 194),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const Text(
                'Comments',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              Divider(color: myMainColor, thickness: 3),
              Expanded(
                child:
                    report.comments.isEmpty
                        ? const Center(child: Text('No comments yet.'))
                        : ListView.builder(
                          itemCount: report.comments.length,
                          itemBuilder: (context, index) {
                            final comment = report.comments[index];
                            return Card(
                              child: ListTile(
                                leading: const Icon(
                                  UniconsLine.comments,
                                  color: Colors.grey,
                                ),
                                subtitle: Text(formatDate(comment.createdAt)),
                                title: Text(comment.content),
                              ),
                            );
                          },
                        ),
              ),
              Divider(color: myMainColor),
              Row(
                children: [
                  Expanded(
                    child: CustomTextField(
                      controller: _commentController,
                      hinttext: "comment on situation",
                    ),
                  ),
                  IconButton(
                    icon: const Icon(UniconsLine.message),
                    onPressed: _addComment,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
