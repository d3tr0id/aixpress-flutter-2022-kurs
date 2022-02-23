import 'package:flutter/material.dart';
import 'package:movies_app/models/movie.dart';
import 'package:movies_app/ui/views/details/moviedetail_viewmodel.dart';
import 'package:stacked/stacked.dart';

class MovieDetailView extends StatelessWidget {
  const MovieDetailView({Key key, this.movie}) : super(key: key);
  final Movie movie;
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MovieDetailViewModel>.reactive(
      viewModelBuilder: () => MovieDetailViewModel(),
      builder: (
        BuildContext context,
        MovieDetailViewModel model,
        Widget child,
      ) {
        model.setMovie(movie);
        return Scaffold(
          body: CustomScrollView(
            slivers: [
              SliverAppBar(
                shape: ContinuousRectangleBorder(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30))),
                pinned: true,
                stretch: true,
                expandedHeight: 300,
                title: Text(movie.title),
                flexibleSpace: FlexibleSpaceBar(
                  stretchModes: [StretchMode.zoomBackground],
                  background: Image.network(
                    movie.poster,
                    color: Colors.black26,
                    colorBlendMode: BlendMode.darken,
                    fit: BoxFit.cover,
                  ),
                ),
                actions: [
                  IconButton(
                      onPressed: model.toggleFavorite,
                      icon: Icon(model.isFavorite
                          ? Icons.favorite
                          : Icons.favorite_border))
                ],
              ),
              SliverToBoxAdapter(
                child: ListTile(
                    leading: Icon(
                      Icons.title,
                      size: 30,
                    ),
                    title: Text(movie.title,
                        style: TextStyle(
                          color: Colors.teal,
                          fontSize: 18,
                        ))),
              ),
              SliverToBoxAdapter(child: Divider()),
              SliverToBoxAdapter(
                child: ListTile(
                    leading: Icon(
                      Icons.info,
                      size: 30,
                    ),
                    title: Text(movie.plot * 5)),
              ),
              SliverToBoxAdapter(child: Divider()),
              SliverToBoxAdapter(
                child: ListTile(
                    leading: Icon(
                      Icons.thumb_up_outlined,
                      size: 30,
                    ),
                    title: Text('IMDb',
                        style: TextStyle(color: Colors.teal, fontSize: 18)),
                    subtitle: Text(movie.rating)),
              ),
              SliverToBoxAdapter(child: Divider()),
              SliverToBoxAdapter(
                child: ListTile(
                    leading: Icon(
                      Icons.calendar_today,
                      size: 30,
                    ),
                    title: Text('Jahr',
                        style: TextStyle(color: Colors.teal, fontSize: 18)),
                    subtitle: Text(movie.year)),
              ),
              SliverToBoxAdapter(child: Divider()),
              SliverToBoxAdapter(
                child: ListTile(
                  leading: Icon(
                    Icons.person_outline,
                    size: 30,
                  ),
                  title: Text('Regisseur',
                      style: TextStyle(color: Colors.teal, fontSize: 18)),
                  subtitle: Text(movie.director),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class MySliverAppBar extends SliverPersistentHeaderDelegate {
  final double expandedHeight;
  final Movie movie;

  MySliverAppBar({@required this.expandedHeight, this.movie});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return AppBar(
      title: Opacity(
        opacity: shrinkOffset / expandedHeight,
        child: Text(
          movie.title,
        ),
      ),
      flexibleSpace: Opacity(
        opacity: 1 - shrinkOffset / expandedHeight,
        child: Image.network(
          movie.poster,
          fit: BoxFit.fitWidth,
        ),
      ),
    );
  }

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => kToolbarHeight + 20;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      true;
}
