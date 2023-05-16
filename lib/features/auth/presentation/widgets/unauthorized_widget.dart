import 'package:firebase/features/auth/presentation/widgets/auth_button_widget.dart';
import 'package:flutter/material.dart';

class UnauthorizedWidget extends StatelessWidget {
  const UnauthorizedWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Expanded(child: SizedBox()),
          Center(
            child: Text(
              'ConvoVerse',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
          ),
          const Expanded(child: SizedBox()),
          AuthButtonWidget(
            imageName: 'images/google.png',
            onPressed: () {},
          ),
          const SizedBox(height: 8),
          AuthButtonWidget(
            text: 'Apple',
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
