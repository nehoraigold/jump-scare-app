// To parse this JSON data, do
//
//     final movie = movieFromJson(jsonString);

import 'dart:convert';

Movie movieFromJson(String str) => Movie.fromJson(json.decode(str));

String movieToJson(Movie data) => json.encode(data.toJson());

class Movie {
  final String title;
  final List<JumpScare> jumpScares;

  Movie({
    required this.title,
    required this.jumpScares,
  });

  factory Movie.fromJson(Map<String, dynamic> json) => Movie(
        title: json["title"],
        jumpScares: List<JumpScare>.from(
            json["jumpScares"].map((x) => JumpScare.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "title": title,
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
        time: parseDuration(json["time"]),
        description: json["description"],
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

Duration parseDuration(String s) {
  final parts = s.split(":");
  final hours = int.parse(parts[0]);
  final minutes = int.parse(parts[1]);
  final seconds = int.parse(parts[2]);
  return Duration(hours: hours, minutes: minutes, seconds: seconds);
}

enum JumpScareType { unknown, major, minor }
