import 'package:flutter/material.dart';

class BigCard extends StatelessWidget {
  const BigCard({
    super.key,
    required this.value,
  });

  final String value;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final style = theme.textTheme.displayMedium!.copyWith(
      color: theme.colorScheme.onPrimary,
    );

    return Card(
      color: theme.colorScheme.primary,
      elevation: 5.0,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Text(
          value,
          style: style,
          semanticsLabel: value,
        ),
      ),
    );
  }
}
