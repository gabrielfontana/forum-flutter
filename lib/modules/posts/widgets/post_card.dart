import 'package:flutter/material.dart';
import 'package:forum/modules/posts/models/post_model.dart';

class PostCard extends StatelessWidget {
  final PostModel post;

  const PostCard({
    Key? key,
    required this.post,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(post.title),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Text(post.description),
            ),
            const Divider(height: 0.0),
            Container(
              padding: const EdgeInsets.only(top: 20.0),
              child: Row(
                children: [
                  _buildLikes(),
                  _buildComments(),
                  _buildViews(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLikes() {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Text('200'),
          const SizedBox(width: 10.0),
          const Icon(Icons.favorite_outline),
        ],
      ),
    );
  }

  Widget _buildComments() {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('500'),
          const SizedBox(width: 10.0),
          const Icon(Icons.comment_outlined),
        ],
      ),
    );
  }

  Widget _buildViews() {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text('${post.views}'),
          const SizedBox(width: 10.0),
          const Icon(Icons.visibility_outlined),
        ],
      ),
    );
  }
}
