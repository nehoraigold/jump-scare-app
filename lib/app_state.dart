import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

import 'package:quiver/async.dart';

import "./model/movie.dart";

class AppState extends ChangeNotifier {
  Movie? selectedMovie;

  void setMovie(Movie? movie) async {
    if (movie == null) {
      selectedMovie = null;
    } else {
      selectedMovie = movie;
    }
    notifyListeners();
  }

  Metronome metronome = Metronome.periodic(const Duration(seconds: 1));
  StreamSubscription<DateTime>? sub;
  Duration currTime = const Duration();
  int _jumpScareIndex = 0;

  void toggle() {
    if (isPlaying()) {
      pauseMovie();
    } else {
      startMovie();
    }
  }

  bool isPlaying() {
    return sub != null;
  }

  JumpScare? nextJumpScare() {
    if (selectedMovie == null) {
      return null;
    }
    if (_jumpScareIndex >= selectedMovie!.jumpScares.length) {
      return null;
    }
    return selectedMovie!.jumpScares[_jumpScareIndex];
  }

  void startMovie() {
    metronome =
        Metronome.periodic(const Duration(seconds: 1), anchor: DateTime.now());
    sub = metronome.listen(
      (_) {
        _onTick();
        ;
        notifyListeners();
      },
      onDone: pauseMovie,
    );
    notifyListeners();
  }

  void pauseMovie() {
    sub?.cancel();
    sub = null;
    notifyListeners();
  }

  void _onTick() {
    currTime = Duration(seconds: currTime.inSeconds + 1);
    final jumpScare = nextJumpScare();
    if (jumpScare != null) {
      if (jumpScare.time.compareTo(currTime) == 0) {
        _onJumpScare();
        _jumpScareIndex++;
      }
    }
    notifyListeners();
  }

  void _onJumpScare() {
    HapticFeedback.vibrate();
  }
}
