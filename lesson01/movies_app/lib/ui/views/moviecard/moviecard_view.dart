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
      viewModelBuilder: () => MovieCardViewModel(),
      onModelReady: (model) => model.setMovie(movie),
      builder: (
        BuildContext context,
        MovieCardViewModel model,
        Widget child,
      ) {
        model.setMovie(movie);
        return Card(
          margin: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          clipBehavior: Clip.hardEdge,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          elevation: 8,
          shadowColor: Colors.black38,
          child: InkWell(
            onTap: model.openMovieDetailView,
            child: Row(children: [
              Container(
                // width: 100,
                // height: ,
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.only(bottomRight: Radius.circular(48))),
                child: Image.network(
                  movie.poster,
                  // width: double.infinity,
                  // width: 100,
                  // height: 500,
                  // opacity: AlwaysStoppedAnimation(1),
                  // fit: BoxFit.fitHeight,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(movie.title,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontSize: 16)),
                      SizedBox(height: 10),
                      Text(movie.year,
                          style: TextStyle(
                              fontSize: 12,
                              color: Colors.black54,
                              fontWeight: FontWeight.bold)),
                      Text(movie.category,
                          style: TextStyle(
                              fontSize: 12,
                              color: Colors.black54,
                              fontWeight: FontWeight.bold)),
                      SizedBox(height: 10),
                      Text(movie.plot,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontSize: 12)),
                      Expanded(
                        child: Align(
                          // heightFactor: 0.5,
                          alignment: Alignment.bottomRight,
                          child: IconButton(
                            splashRadius: 30,
                            icon: Icon(
                              model.isFavorite
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              size: 30,
                              color: model.isFavorite
                                  ? Colors.red
                                  : Colors.black54,
                            ),
                            onPressed: model.toggleFavorite,
                          ),
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
