import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:jump_scare_app/utils/utils.dart';
import 'package:jump_scare_app/model/movie.dart';
import 'package:jump_scare_app/components/jump_scare_tile.dart';
import 'package:jump_scare_app/components/big_card.dart';
import 'package:jump_scare_app/app_state.dart';

class WatchMovieScreen extends StatefulWidget {
  const WatchMovieScreen(
      {super.key, required this.movie, required this.onBackButton});

  final Movie movie;
  final Function() onBackButton;

  @override
  State<WatchMovieScreen> createState() => _WatchMovieScreenState();
}

class _WatchMovieScreenState extends State<WatchMovieScreen> {
  @override
  Widget build(BuildContext context) {
    final appState = context.watch<AppState>();
    final nextJumpScare = appState.nextJumpScare();

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BigCard(value: durationToString(appState.currTime)),
          IntrinsicWidth(
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            ElevatedButton.icon(
              icon: const Icon(Icons.arrow_back_ios_new),
              onPressed: () {
                appState.pauseMovie();
                widget.onBackButton();
              },
              label: const Text("Back"),
            ),
            ElevatedButton.icon(
              onPressed: () => {appState.toggle()},
              label: Text(appState.isPlaying() ? "Pause" : "Play"),
              icon: Icon(appState.isPlaying() ? Icons.pause : Icons.play_arrow),
            ),
          ])),
          SizedBox(height: 50),
          nextJumpScare == null
              ? const Text("No jump scares.")
              : JumpScareTile(nextJumpScare)
        ],
      ),
    );
  }
}
