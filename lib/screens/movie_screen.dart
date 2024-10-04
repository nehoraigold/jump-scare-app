import 'dart:async';
import 'package:jump_scare_app/screens/watch_movie_screen.dart';
import 'package:quiver/async.dart';

import 'package:flutter/material.dart';
import 'package:jump_scare_app/components/jump_scare_tile.dart';
import 'package:jump_scare_app/model/movie.dart';

class MovieScreen extends StatefulWidget {
  final Movie movie;
  final Function() onBackButton;

  MovieScreen(this.movie, this.onBackButton);

  @override
  State<MovieScreen> createState() => _MovieScreenState();
}

class _MovieScreenState extends State<MovieScreen> {
  bool _isStarted = false;

  @override
  Widget build(BuildContext context) {
    if (_isStarted) {
      return WatchMovieScreen(
          movie: widget.movie,
          onBackButton: () => {
                setState(() {
                  _isStarted = false;
                })
              });
    }
    final jumpScares = <JumpScareTile>[];
    for (var js in widget.movie.jumpScares) {
      jumpScares.add(JumpScareTile(js));
    }

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: ListView(children: [
        Row(children: [
          BackButton(
            onPressed: widget.onBackButton,
          ),
          Center(
              child: Text(
            widget.movie.title,
            style: Theme.of(context).textTheme.headlineLarge,
            textAlign: TextAlign.center,
          )),
        ]),
        ElevatedButton.icon(
            icon: Icon(Icons.movie),
            label: Text("Watch Movie"),
            onPressed: () {
              setState(() {
                _isStarted = true;
              });
            }),
        ...jumpScares,
      ]),
    );
  }
}
