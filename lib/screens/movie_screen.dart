import 'package:flutter/material.dart';
import 'package:jump_scare_app/components/jump_scare_tile.dart';
import 'package:jump_scare_app/model/movie.dart';

class MovieScreen extends StatelessWidget {
  final Movie movie;
  final Function() onBackButton;

  MovieScreen(this.movie, this.onBackButton);

  @override
  Widget build(BuildContext context) {
    final jumpScares = <JumpScareTile>[];
    for (var js in movie.jumpScares) {
      jumpScares.add(JumpScareTile(js));
    }

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: ListView(children: [
        Row(children: [
          BackButton(
            onPressed: onBackButton,
          ),
          Center(
              child: Text(
            movie.title,
            style: Theme.of(context).textTheme.headlineLarge,
            textAlign: TextAlign.center,
          )),
        ]),
        ElevatedButton.icon(
            icon: Icon(Icons.timer),
            label: Text("Start Movie"),
            onPressed: () {
              print('pressed!');
            }),
        ...jumpScares,
      ]),
    );
  }
}
