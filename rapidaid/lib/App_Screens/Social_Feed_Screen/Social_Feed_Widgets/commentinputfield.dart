import 'package:flutter/material.dart';
import 'package:unicons/unicons.dart';

class CommentInputField extends StatefulWidget {
  final String postId;
  final Function(String, String) onSubmit;

  const CommentInputField({
    super.key,
    required this.postId,
    required this.onSubmit,
  });

  @override
  CommentInputFieldState createState() => CommentInputFieldState();
}

class CommentInputFieldState extends State<CommentInputField> {
  final TextEditingController _controller = TextEditingController();

  void _submitComment() {
    final text = _controller.text.trim();
    if (text.isEmpty) return;
    widget.onSubmit(widget.postId, text);
    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(hintText: 'Add a comment...'),
            ),
          ),
          IconButton(
            icon: Icon(UniconsLine.comment_message),
            onPressed: _submitComment,
          ),
        ],
      ),
    );
  }
}