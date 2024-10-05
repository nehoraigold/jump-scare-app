import 'package:flutter/material.dart';
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

  var favorites = <Movie>[];

  void toggleFavorite() {
    if (selectedMovie == null) {
      return;
    }
    if (favorites.contains(selectedMovie)) {
      favorites.remove(selectedMovie);
    } else {
      favorites.add(selectedMovie!);
    }
    notifyListeners();
  }
}
