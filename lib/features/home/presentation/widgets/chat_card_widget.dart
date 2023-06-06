import 'package:cached_network_image/cached_network_image.dart';
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
      leading: imageUrl.isEmpty
          ? const SizedBox(
              height: 50,
              width: 50,
              child: CircleAvatar(
                backgroundImage: AssetImage('images/user.png'),
              ),
            )
          : SizedBox(
              height: 50,
              width: 50,
              child: CircleAvatar(
                backgroundImage: CachedNetworkImageProvider(imageUrl),
              ),
            ),
      subtitle: Text(
        message,
        style: Theme.of(context).textTheme.labelSmall,
      ),
    );
  }
}
