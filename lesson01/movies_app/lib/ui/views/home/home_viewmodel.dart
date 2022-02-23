import 'package:movies_app/locator.dart';
import 'package:movies_app/models/movie.dart';
import 'package:movies_app/services/MovieService.dart';
import 'package:stacked/stacked.dart';

class HomeViewModel extends BaseViewModel {
  final _movieService = locator<MovieService>();
  List<Movie> get movies => _movieService.allMovies;

  init() async {
    await runBusyFuture(_movieService.getAllMovies());
  }
}
