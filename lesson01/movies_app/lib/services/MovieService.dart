import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:movies_app/locator.dart';
import 'package:movies_app/models/movie.dart';
import 'package:movies_app/services/ApiService.dart';
import 'package:stacked/stacked.dart';

class MovieService with ReactiveServiceMixin {
  MovieService() {
    listenToReactiveValues(favoriteMovies);
  }

  final _apiService = locator<APIService>();
  List<Movie> allMovies = [];
  List<Movie> favoriteMovies = [];

  getAllMovies() async {
    allMovies = await _apiService.fetchAllMoviesHttp();
  }

  toggleFavorite(Movie movie) {
    favoriteMovies.contains(movie)
        ? favoriteMovies.remove(movie)
        : favoriteMovies.add(movie);
    notifyListeners();
  }
}
