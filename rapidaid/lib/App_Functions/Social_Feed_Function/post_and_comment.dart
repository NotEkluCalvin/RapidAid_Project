class Post {
  final String id;
  final String content;
  final List<Comment> comments;

  Post({required this.id, required this.content, this.comments = const []});
}

class Comment {
  final String id;
  final String content;

  Comment({required this.id, required this.content});
}

