import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:jump_scare_app/app_state.dart';
import 'package:jump_scare_app/model/movie.dart';

class MovieTile extends StatelessWidget {
  final Movie movie;

  MovieTile(this.movie);

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
          appState.setMovie(movie);
        },
        child: Text(movie.title),
      ),
    );
  }
}
