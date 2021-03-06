import 'package:movies_app/locator.dart';
import 'package:movies_app/models/movie.dart';
import 'package:movies_app/services/MovieService.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class MovieDetailViewModel extends BaseViewModel {
  final _movieService = locator<MovieService>();
  Movie _movie;
  Movie get movie => _movie;

  setMovie(Movie m) {
    _movie = m;
  }

  bool get isFavorite => _movieService.favoriteMovies.contains(movie);

  toggleFavorite() {
    _movieService.toggleFavorite(movie);
    notifyListeners();
  }
}
