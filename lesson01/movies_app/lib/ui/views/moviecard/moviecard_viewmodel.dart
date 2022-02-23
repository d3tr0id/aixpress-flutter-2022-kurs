import 'package:movies_app/locator.dart';
import 'package:movies_app/models/movie.dart';
import 'package:movies_app/services/MovieService.dart';
import 'package:movies_app/ui/views/details/moviedetail_view.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class MovieCardViewModel extends BaseViewModel {
  final _movieService = locator<MovieService>();
  final _navigationService = locator<NavigationService>();
  Movie _movie;
  Movie get movie => _movie;
  bool get isFavorite => _movieService.favoriteMovies.contains(movie);

  setMovie(Movie m) {
    _movie = m;
  }

  toggleFavorite() {
    _movieService.toggleFavorite(movie);
    notifyListeners();
  }

  openMovieDetailView() async {
    await _navigationService.navigateToView(MovieDetailView(movie: movie));
    // notifyListeners();
  }
}
