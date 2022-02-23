import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:movies_app/models/movie.dart';
import 'package:http/http.dart' as http;

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

  Future<List<Movie>> fetchAllMoviesHttp() async {
    List<Movie> movies = [];

    http.Response response = await http.get(
      Uri.parse('http://localhost:3000/movies'),
      headers: {"Accept": 'application/json'},
    );

    final data = await json.decode(response.body);

    for (var entry in data) {
      Movie movie = Movie.fromMap(entry);
      movies.add(movie);
    }

    return movies;
  }
}
