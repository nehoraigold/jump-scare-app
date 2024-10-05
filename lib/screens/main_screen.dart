import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:jump_scare_app/app_state.dart';
import 'package:jump_scare_app/http/client.dart';
import 'package:jump_scare_app/model/movie.dart';
import 'package:jump_scare_app/screens/movie_screen.dart';
import 'package:jump_scare_app/screens/movies_screen.dart';

class MainScreen extends StatefulWidget {
  MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  Future<List<Movie>> allMovies = client.getMovies();

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<AppState>();
    if (appState.selectedMovie != null) {
      return MovieScreen(
          appState.selectedMovie!, () => appState.setMovie(null));
    }
    return FutureBuilder(
      future: allMovies,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return MoviesScreen(snapshot.requireData);
        } else if (snapshot.hasError) {
          print(snapshot.error);
          return const Center(child: Text("Connection error!"));
        }
        return const Center(child: Text("Loading movies..."));
      },
    );
  }
}
