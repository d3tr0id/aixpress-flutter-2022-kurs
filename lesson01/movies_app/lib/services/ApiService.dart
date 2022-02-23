import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:movies_app/models/movie.dart';

class APIService {
  Future<List<Movie>> fetchAllMovies() async {
    List<Movie> movies = [];
    final String response = await rootBundle.loadString('assets/movies.json');
    final data = await json.decode(response);
    for (var entry in data['movies']) {
      Movie movie = Movie.fromMap(entry);
      movies.add(movie);
    }
    await Future.delayed(Duration(seconds: 1));
    return movies;
  }
}
