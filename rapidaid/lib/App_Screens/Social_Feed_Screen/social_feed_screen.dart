import 'package:flutter/material.dart';
import 'package:rapidaidv2/App_Components/App_Style/colors.dart';
import 'package:rapidaidv2/App_Components/App_Widgets/custom_text_field.dart';
import 'package:rapidaidv2/App_Functions/Social_Feed_Function/post_and_comment.dart';
import 'package:unicons/unicons.dart';
import 'package:uuid/uuid.dart';
import 'Social_Feed_Widgets/commentinputfield.dart';

class SocialFeedScreen extends StatefulWidget {
  const SocialFeedScreen({super.key});

  @override
  State<SocialFeedScreen> createState() => _SocialFeedScreenState();
}

class _SocialFeedScreenState extends State<SocialFeedScreen> {
  final List<Post> posts = [];
  final TextEditingController _postController = TextEditingController();
  final uuid = Uuid();

  void _addPost(String content) {
    if (content.isEmpty) return;
    setState(() {
      posts.insert(0, Post(id: uuid.v4(), content: content));
      _postController.clear();
    });
  }

  void _addComment(String postId, String commentContent) {
    setState(() {
      final postIndex = posts.indexWhere((p) => p.id == postId);
      final updatedPost = posts[postIndex];
      posts[postIndex] = Post(
        id: updatedPost.id,
        content: updatedPost.content,
        comments: [
          ...updatedPost.comments,
          Comment(id: uuid.v4(), content: commentContent),
        ],
      );
    });
  }

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
                children: [
                  Icon(UniconsLine.users_alt, size: 40, color: Colors.white),
                  SizedBox(height: 8),
                  Text(
                    'COMMUNITY',
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
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: CustomTextField(
                    controller: _postController,
                    hinttext: "What's on your mind?",
                    onTap: () {},
                  ),
                ),

                IconButton(
                  icon: Icon(UniconsLine.message),
                  onPressed: () => _addPost(_postController.text),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: posts.length,
              itemBuilder: (context, index) {
                final post = posts[index];
                return Card(
                  margin: const EdgeInsets.all(8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  elevation: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          post.content,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8),
                        Divider(),
                        Text(
                          'Comments:',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        for (var comment in post.comments)
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 4.0),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.comment,
                                  size: 16,
                                  color: Colors.grey,
                                ),
                                SizedBox(width: 6),
                                Expanded(child: Text(comment.content)),
                              ],
                            ),
                          ),
                        CommentInputField(
                          postId: post.id,
                          onSubmit: _addComment,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
