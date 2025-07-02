import 'package:flutter/material.dart';
import 'package:jump_scare_app/components/playback_component.dart';
import 'package:provider/provider.dart';

import 'package:jump_scare_app/app_state.dart';
import 'package:jump_scare_app/components/jump_scare_tile.dart';
import 'package:jump_scare_app/model/movie.dart';

class MovieScreen extends StatelessWidget {
  final Movie movie;
  final Function() onBackButton;

  MovieScreen(this.movie, this.onBackButton);

  @override
  Widget build(BuildContext context) {
    final appState = context.watch<AppState>();

    final widgets = <Widget>[];
    if (appState.currTime.compareTo(const Duration()) != 0) {
      widgets.add(PlaybackComponent());
    } else {
      widgets.add(ElevatedButton.icon(
          icon: Icon(Icons.movie),
          label: Text("Watch Movie"),
          onPressed: () {
            appState.startMovie();
          }));
    }

    for (var js in movie.jumpScares) {
      widgets.add(JumpScareTile(js));
    }

    return SafeArea(
      child: Padding(
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
          ...widgets,
        ]),
      ),
    );
  }
}
