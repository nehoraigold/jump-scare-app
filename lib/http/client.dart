import "package:http/http.dart";
import "../model/movie.dart";

class HttpClient {
  final client = Client();
  static const String host = 'localhost:8080';
  static const String moviesEndpoint = '/movies';

  Future<List<Movie>> getMovies() async {
    var response = await client.get(Uri.http(host, moviesEndpoint));
    return movieListFromJson(response.body);
  }
}

final client = HttpClient();
