import 'package:flutter/material.dart';
import 'package:movies_app/models/movie.dart';
import 'package:movies_app/ui/views/moviecard/moviecard_viewmodel.dart';
import 'package:stacked/stacked.dart';

class MovieCardView extends StatelessWidget {
  const MovieCardView({Key key, this.movie}) : super(key: key);
  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MovieCardViewModel>.reactive(
      viewModelBuilder: () => MovieCardViewModel(movie),
      builder: (
        BuildContext context,
        MovieCardViewModel model,
        Widget child,
      ) {
        return GestureDetector(
          onTap: model.openMovieDetailView,
          child: Card(
            margin: EdgeInsets.all(16),
            clipBehavior: Clip.hardEdge,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            elevation: 8,
            child: Column(children: [
              Expanded(
                flex: 4,
                child: Image.network(
                  movie.poster,
                  width: double.infinity,
                  // height: 500,
                  opacity: AlwaysStoppedAnimation(1),
                  fit: BoxFit.cover,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 3,
                        child: Text(movie.title,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style:
                                TextStyle(fontSize: 24, color: Colors.white70)),
                      ),
                      Expanded(
                        child: IconButton(
                          splashRadius: 30,
                          padding: const EdgeInsets.all(0),
                          icon: Icon(
                            model.isFavorite
                                ? Icons.favorite
                                : Icons.favorite_border,
                            size: 40,
                          ),
                          onPressed: model.toggleFavorite,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ]),
          ),
        );
      },
    );
  }
}
