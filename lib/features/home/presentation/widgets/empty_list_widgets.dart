import 'package:flutter/material.dart';

class EmptyListWidget extends StatelessWidget {
  const EmptyListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
        child: SizedBox(
      height: MediaQuery.of(context).size.height - 300,
      child: Center(
          child: Text(
        'Empty list',
        style: Theme.of(context).textTheme.bodyMedium,
      )),
    ));
  }
}
