import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:jump_scare_app/app_state.dart';

class MovieTile extends StatelessWidget {
  final String title;

  MovieTile(this.title);

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<AppState>();

    return ListTile(
      title: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Theme.of(context).colorScheme.primary,
          foregroundColor: Theme.of(context).colorScheme.onPrimary,
        ),
        onPressed: () async {
          appState.setMovie(title);
        },
        child: Text(title),
      ),
    );
  }
}
