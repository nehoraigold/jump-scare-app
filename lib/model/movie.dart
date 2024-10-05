// To parse this JSON data, do
//
//     final movie = movieFromJson(jsonString);

import 'dart:convert';

import 'package:jump_scare_app/utils/utils.dart';

List<Movie> movieListFromJson(String str) {
  final List<dynamic> jsonData = jsonDecode(str);
  return List<Movie>.from(jsonData.map((item) => Movie.fromJson(item)));
}
Movie movieFromJson(String str) => Movie.fromJson(json.decode(str));

String movieToJson(Movie data) => json.encode(data.toJson());

class Movie {
  final String title;
  final String? director;
  final String? year;
  final List<JumpScare> jumpScares;

  Movie({
    required this.title,
    required this.jumpScares,
    this.director,
    this.year,
  });

  factory Movie.fromJson(Map<String, dynamic> json) => Movie(
        title: json["title"],
        director: json["director"],
        year: json["year"],
        jumpScares: List<JumpScare>.from(
            (json["jumpScares"] ?? []).map((x) => JumpScare.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "year": year,
        "director": director,
        "jumpScares": List<dynamic>.from(jumpScares.map((x) => x.toJson())),
      };
}

class JumpScare {
  final Duration time;
  final String description;
  final JumpScareType type;

  JumpScare({
    required this.time,
    required this.description,
    required this.type,
  });

  factory JumpScare.fromJson(Map<String, dynamic> json) => JumpScare(
        time: stringToDuration(json["time"]),
        description: json["description"] ?? '', 
        type: json["type"] == "major"
            ? JumpScareType.major
            : json["type"] == "minor"
                ? JumpScareType.minor
                : JumpScareType.unknown,
      );

  Map<String, dynamic> toJson() => {
        "time": time.toString(),
        "description": description,
        "type": type == JumpScareType.major
            ? "major"
            : type == JumpScareType.minor
                ? "minor"
                : "",
      };
}

enum JumpScareType { unknown, major, minor }
