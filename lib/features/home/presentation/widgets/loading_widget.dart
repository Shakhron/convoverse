import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
        child: SizedBox(
            height: MediaQuery.of(context).size.height - 300,
            child: Center(
                child: CircularProgressIndicator(
              color: Theme.of(context).indicatorColor,
            ))));
  }
}
