import 'package:flutter/material.dart';

class ChatCardWidget extends StatelessWidget {
  final String name;
  final String imageUrl;
  final String message;
  const ChatCardWidget(
      {super.key,
      required this.name,
      required this.imageUrl,
      required this.message});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        name,
        style: Theme.of(context).textTheme.bodyLarge,
      ),
      leading: const Icon(
        Icons.face,
        size: 50,
      ),
      subtitle: Text(
        message,
        style: Theme.of(context).textTheme.labelSmall,
      ),
    );
  }
}
