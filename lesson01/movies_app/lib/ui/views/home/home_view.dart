import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:movies_app/models/movie.dart';
import 'package:movies_app/ui/views/home/home_viewmodel.dart';
import 'package:movies_app/ui/views/moviecard/moviecard_view.dart';
import 'package:stacked/stacked.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      viewModelBuilder: () => HomeViewModel(),
      onModelReady: (model) => model.init(),
      builder: (
        BuildContext context,
        HomeViewModel model,
        Widget child,
      ) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Home View'),
          ),
          body: model.isBusy
              ? Center(child: CircularProgressIndicator())
              : model.movies.isEmpty
                  ? SizedBox.shrink()
                  : GridView(
                      children: model.movies
                          .map((e) => MovieCardView(
                                movie: e,
                              ))
                          .toList(),
                      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          maxCrossAxisExtent: 400,
                          mainAxisExtent: 500)),
        );
      },
    );
  }
}
