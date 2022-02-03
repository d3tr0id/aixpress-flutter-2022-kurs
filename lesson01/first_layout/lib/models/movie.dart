import 'dart:convert';

class Movie {
  String country;
  String director;
  String plot;
  String poster;
  String year;
  String title;
  String rating;
  int id;
  String category;
  Movie({
    required this.country,
    required this.director,
    required this.plot,
    required this.poster,
    required this.year,
    required this.title,
    required this.rating,
    required this.id,
    required this.category,
  });

  factory Movie.fromMap(Map<String, dynamic> map) {
    return Movie(
      country: map['country'] ?? '',
      director: map['director'] ?? '',
      plot: map['plot'] ?? '',
      poster: map['poster'] ?? '',
      year: map['year'] ?? '',
      title: map['title'] ?? '',
      rating: map['rating'] ?? '',
      id: map['id'] ?? '',
      category: map['category'] ?? '',
    );
  }

  factory Movie.fromJson(String source) => Movie.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Movie(country: $country, director: $director, plot: $plot, poster: $poster, year: $year, title: $title, rating: $rating, id: $id, category: $category)';
  }
}
