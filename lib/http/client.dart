import "package:http/http.dart";
import "../model/movie.dart";

class HttpClient {
  final client = Client();
  static const String host =
      '635c-2601-647-6400-1b20-5943-7ba8-60f8-26c0.ngrok-free.app';
  static const String moviesEndpoint = '/movies';

  Future<List<Movie>> getMovies() async {
    var response = await client.get(Uri.http(host, moviesEndpoint));
    return movieListFromJson(response.body);
  }
}

final client = HttpClient();
