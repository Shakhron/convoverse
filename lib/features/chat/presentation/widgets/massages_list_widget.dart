import 'package:firebase/features/chat/domain/entities/message.dart';
import 'package:flutter/material.dart';

class MessageListWidget extends StatelessWidget {
  final List<Message> messages;
  const MessageListWidget({super.key, required this.messages});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return Text(
          messages[index].content,
          style: const TextStyle(color: Colors.black),
        );
      },
      itemCount: messages.length,
    );
  }
}
