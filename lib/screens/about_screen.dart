import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final headlineStyle = Theme.of(context).textTheme.headlineLarge;
    final textColor = Theme.of(context).colorScheme.primary;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "About",
            style: headlineStyle,
            selectionColor: textColor,
          ),
          const Text(
              "This app was created by Ori Gold after being dragged kicking and screaming to countless scary movies by his partner.")
        ],
      ),
    );
  }
}
