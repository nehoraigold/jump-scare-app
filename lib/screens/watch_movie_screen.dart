import 'dart:async';

import 'package:flutter/material.dart';
import 'package:jump_scare_app/utils/utils.dart';
import 'package:quiver/async.dart';

import 'package:jump_scare_app/model/movie.dart';
import 'package:jump_scare_app/components/jump_scare_tile.dart';
import 'package:jump_scare_app/components/big_card.dart';

class WatchMovieScreen extends StatefulWidget {
  const WatchMovieScreen(
      {super.key, required this.movie, required this.onBackButton});

  final Movie movie;
  final Function() onBackButton;

  @override
  State<WatchMovieScreen> createState() => _WatchMovieScreenState();
}

class _WatchMovieScreenState extends State<WatchMovieScreen> {
  Metronome metronome = Metronome.periodic(const Duration(seconds: 1));
  StreamSubscription<DateTime>? sub;
  Duration _currTime = const Duration();
  int _jumpScareIndex = 0;

  void _toggle() {
    if (_isPlaying()) {
      _pauseMovie();
    } else {
      _startMovie();
    }
  }

  bool _isPlaying() {
    return sub != null;
  }

  JumpScare? _nextJumpScare() {
    if (_jumpScareIndex >= widget.movie.jumpScares.length) {
      return null;
    }
    return widget.movie.jumpScares[_jumpScareIndex];
  }

  void _startMovie() {
    metronome =
        Metronome.periodic(const Duration(seconds: 1), anchor: DateTime.now());
    sub = metronome.listen((event) {
      setState(() {
        _onTick();
      });
    }, onDone: _pauseMovie);
  }

  void _pauseMovie() {
    sub?.cancel();
    sub = null;
  }

  void _onTick() {
    _currTime = Duration(seconds: _currTime.inSeconds + 1);
    final nextJumpScare = _nextJumpScare();
    if (nextJumpScare != null) {
      if (nextJumpScare.time.compareTo(_currTime) == 0) {
        _jumpScareIndex++;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final nextJumpScare = _nextJumpScare();

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BigCard(value: durationToString(_currTime)),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            ElevatedButton.icon(
              icon: const Icon(Icons.arrow_back_ios_new),
              onPressed: () {
                setState(() {
                  _pauseMovie();
                });
                widget.onBackButton();
              },
              label: const Text("Back"),
            ),
            ElevatedButton.icon(
              onPressed: () => {
                setState(() {
                  _toggle();
                })
              },
              label: Text(_isPlaying() ? "Pause" : "Play"),
              icon: Icon(_isPlaying() ? Icons.pause : Icons.play_arrow),
            ),
          ]),
          SizedBox(height: 50),
          nextJumpScare == null
              ? const Text("No jump scares.")
              : JumpScareTile(nextJumpScare)
        ],
      ),
    );
  }
}
