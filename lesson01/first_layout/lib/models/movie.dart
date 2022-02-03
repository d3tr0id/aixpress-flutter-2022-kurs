import 'dart:convert';

class MoviesResponse {
  final List<Movie> movies;
  final List<String> categories;
  final List<String> years;
  MoviesResponse({
    this.movies,
    this.categories,
    this.years,
  });

  Map<String, dynamic> toMap() {
    return {
      'movies': movies.map((x) => x.toMap()).toList(),
      'categories': categories,
      'years': years,
    };
  }

  factory MoviesResponse.fromMap(Map<String, dynamic> map) {
    return MoviesResponse(
      movies: List<Movie>.from(map['movies']?.map((x) => Movie.fromMap(x))),
      categories: List<String>.from(map['categories']),
      years: List<String>.from(map['years']),
    );
  }

  String toJson() => json.encode(toMap());

  factory MoviesResponse.fromJson(String source) =>
      MoviesResponse.fromMap(json.decode(source));

  @override
  String toString() =>
      'Movies(movies: $movies, categories: $categories, years: $years)';
}

class Movie {
  final String country;
  final String director;
  final String category;
  final String plot;
  final String poster;
  final String year;
  final String title;
  final String imdbRating;
  final int id;
  Movie({
    this.country,
    this.director,
    this.category,
    this.plot,
    this.poster,
    this.year,
    this.title,
    this.imdbRating,
    this.id,
  });

  Map<String, dynamic> toMap() {
    return {
      'country': country,
      'director': director,
      'category': category,
      'plot': plot,
      'poster': poster,
      'year': year,
      'title': title,
      'imdbRating': imdbRating,
      'id': id,
    };
  }

  factory Movie.fromMap(Map<String, dynamic> map) {
    return Movie(
      country: map['country'] ?? '',
      director: map['director'] ?? '',
      category: map['category'] ?? '',
      plot: map['plot'] ?? '',
      poster: map['poster'] ?? '',
      year: map['year'] ?? '',
      title: map['title'] ?? '',
      imdbRating: map['imdbRating'] ?? '',
      id: map['id']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Movie.fromJson(String source) => Movie.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Movie(country: $country, director: $director, category: $category, plot: $plot, poster: $poster, year: $year, title: $title, imdbRating: $imdbRating, id: $id)';
  }
}
