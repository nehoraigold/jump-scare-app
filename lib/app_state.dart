import 'package:flutter/material.dart';
import "./model/movie.dart";
import "./http/client.dart";

class AppState extends ChangeNotifier {
  Movie? selectedMovie;

  void setMovie(String? title) async {
    if (title == null) {
      selectedMovie = null;
    } else {
      selectedMovie = await client.getMovie(title);
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
