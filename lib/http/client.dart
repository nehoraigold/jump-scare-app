import "dart:convert";
import "package:http/http.dart";
import "../model/movie.dart";

class HttpClient {
  final client = Client();
  static const String host = 'localhost:8080';
  static const String moviesEndpoint = '/movies';
  static const String movieEndpoint = '/movie';

  Future<List<String>> getMovies() async {
    var response = await client.get(Uri.http(host, moviesEndpoint));
    return List<String>.from(jsonDecode(response.body));
  }

  Future<Movie> getMovie(String movie) async {
    Response response =
        await client.get(Uri.http(host, "$movieEndpoint/$movie"));
    return movieFromJson(response.body);
  }
}

Duration parseDuration(String s) {
  List<String> parts = s.split(':');
  int hours = int.parse(parts[0]);
  int minutes = int.parse(parts[1]);
  int seconds = int.parse(parts[2]);
  return Duration(hours: hours, minutes: minutes, seconds: seconds);
}

final client = HttpClient();
