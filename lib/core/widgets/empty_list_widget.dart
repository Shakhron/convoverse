import 'package:flutter/material.dart';

class EmptyListWidget extends StatelessWidget {
  const EmptyListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text(
      'Empty list',
      style: Theme.of(context).textTheme.bodyMedium,
    ));
  }
}
