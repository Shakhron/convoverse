import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget {
  final String title;
  final String? imageUrl;
  const AppBarWidget({super.key, required this.title, this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      elevation: 0,
      pinned: true,
      snap: true,
      floating: true,
      expandedHeight: 145,
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        title: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            GestureDetector(
              onTap: () => null,
              child: imageUrl == null
                  ? const SizedBox(
                      height: 35,
                      width: 35,
                      child: CircleAvatar(
                        backgroundImage: AssetImage('images/user.png'),
                      ),
                    )
                  : SizedBox(
                      height: 35,
                      width: 35,
                      child: CircleAvatar(
                        backgroundImage: CachedNetworkImageProvider(imageUrl!),
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
