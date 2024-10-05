import "package:flutter/material.dart";

import "package:jump_scare_app/components/movie_tile.dart";
import "package:jump_scare_app/model/movie.dart";

class MoviesScreen extends StatefulWidget {
  final List<Movie> allMovies;

  MoviesScreen(this.allMovies, {super.key});

  @override
  State<MoviesScreen> createState() => _MoviesScreenState(allMovies);
}

class _MoviesScreenState extends State<MoviesScreen> {
  List<Movie>? _movies;

  _MoviesScreenState(this._movies);

  void _filterMovies(String search) {
    _movies =
        widget.allMovies.where((movie) => movie.title.toLowerCase().contains(search.toLowerCase())).toList();
  }

  @override
  Widget build(BuildContext context) {
    Widget movieTitles;
    if (_movies == null || _movies!.isEmpty) {
      movieTitles = const Center(child: Text("No movies."));
    } else {
      final tiles = <MovieTile>[];
      for (final movie in _movies!) {
        tiles.add(MovieTile(movie));
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
