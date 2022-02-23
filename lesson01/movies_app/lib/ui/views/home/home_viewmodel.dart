import 'package:movies_app/locator.dart';
import 'package:movies_app/models/movie.dart';
import 'package:movies_app/services/MovieService.dart';
import 'package:stacked/stacked.dart';

class HomeViewModel extends ReactiveViewModel {
  final _movieService = locator<MovieService>();
  List<Movie> get movies => _movieService.allMovies;
  List<Movie> get favMovies => _movieService.favoriteMovies;
  bool _showFavorites = false;
  bool get showFavorites => _showFavorites;

  init() async {
    await runBusyFuture(_movieService.getAllMovies());
  }

  toggleFavoriteView() {
    _showFavorites = !_showFavorites;
    notifyListeners();
  }

  @override
  List<ReactiveServiceMixin> get reactiveServices => [_movieService];
}
