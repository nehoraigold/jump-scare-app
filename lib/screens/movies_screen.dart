import "package:flutter/material.dart";

import "package:jump_scare_app/movie_tile.dart";

class MoviesScreen extends StatelessWidget {
  final Future<List<String>> movies;

  MoviesScreen(this.movies, {super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<String>>(
      future: movies,
      initialData: const [],
      builder: (BuildContext context, AsyncSnapshot<List<String>> snapshot) {
        if (snapshot.hasData) {
          final tiles = <MovieTile>[];
          for (final title in snapshot.data!) {
            tiles.add(MovieTile(title));
          }
          return ListView(
            children: tiles,
          );
        } else if (snapshot.hasError) {
          print(snapshot.error);
          return const Center(child: Text("encountered error!"));
        }
        return const Center(child: Text("No movies."));
      },
    );
  }
}
