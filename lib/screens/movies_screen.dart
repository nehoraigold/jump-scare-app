import "package:flutter/material.dart";

import "package:jump_scare_app/components/movie_tile.dart";

class MoviesScreen extends StatefulWidget {
  final List<String> allMovies;

  MoviesScreen(this.allMovies, {super.key});

  @override
  State<MoviesScreen> createState() => _MoviesScreenState(allMovies);
}

class _MoviesScreenState extends State<MoviesScreen> {
  List<String>? _movieTitles;

  _MoviesScreenState(this._movieTitles);

  void _filterMovies(String search) {
    _movieTitles =
        widget.allMovies.where((title) => title.contains(search)).toList();
  }

  @override
  Widget build(BuildContext context) {
    Widget movieTitles;
    if (_movieTitles == null || _movieTitles!.isEmpty) {
      movieTitles = const Center(child: Text("No movies."));
    } else {
      final tiles = <MovieTile>[];
      for (final title in _movieTitles!) {
        tiles.add(MovieTile(title));
      }
      movieTitles = Wrap(children: tiles);
    }

    return SafeArea(
      child: ListView(children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: SearchBar(
            leading: const Icon(Icons.search_rounded),
            onChanged: (value) {
              setState(() {
                _filterMovies(value);
              });
            },
          ),
        ),
        movieTitles,
      ]),
    );
  }
}
