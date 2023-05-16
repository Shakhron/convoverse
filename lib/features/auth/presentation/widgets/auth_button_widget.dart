import 'package:flutter/material.dart';

class AuthButtonWidget extends StatelessWidget {
  final Function()? onPressed;
  final String? imageName;
  final String? text;
  const AuthButtonWidget(
      {super.key, required this.onPressed, this.imageName, this.text});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
            backgroundColor:
                MaterialStatePropertyAll(Theme.of(context).canvasColor)),
        child: imageName == null
            ? Text(
                text ?? '',
                style: Theme.of(context).textTheme.bodyMedium,
              )
            : Image.asset(imageName ?? ''),
      ),
    );
  }
}
