import 'dart:developer';

import 'package:first_layout/models/movie.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeView extends StatefulWidget {
  HomeView({Key key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  Future<List<Movie>> allMovies;
  List<Movie> favoriteMovies = [];

  Future<List<Movie>> readJson() async {
    MoviesResponse moviesResponse;
    final String response = await rootBundle.loadString('assets/movies.json');
    await Future.delayed(Duration(seconds: 1));
    moviesResponse = MoviesResponse.fromJson(response);
    return moviesResponse.movies;
  }

  @override
  void initState() {
    super.initState();
    allMovies = readJson();
  }

  bool isMovieFavorite(Movie m) {
    return favoriteMovies.where((element) => element.id == m.id).isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Home'),
        ),
        body: FutureBuilder<List<Movie>>(
            future: allMovies,
            builder: (context, snap) {
              if (snap.connectionState == ConnectionState.waiting)
                return Center(child: CircularProgressIndicator());

              if (snap.connectionState == ConnectionState.done) {
                if (snap.hasData) {
                  return ListView(
                    children: snap.data
                        .map((e) => SizedBox(
                              height: 200,
                              child: Card(
                                  margin: EdgeInsets.all(12),
                                  clipBehavior: Clip.hardEdge,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20)),
                                  elevation: 8,
                                  shadowColor: Colors.black26,
                                  child: InkWell(
                                    onTap: () => print('card tapped'),
                                    child: Row(
                                      children: [
                                        Container(
                                            clipBehavior: Clip.hardEdge,
                                            child: Image.network(
                                              e.poster,
                                            ),
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.only(
                                                    bottomRight:
                                                        Radius.circular(50)))),
                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(e.title,
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: Colors.black87)),
                                                SizedBox(height: 10),
                                                Text(e.year,
                                                    style: TextStyle(
                                                        fontSize: 11,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.black54)),
                                                Text(e.category,
                                                    style: TextStyle(
                                                        fontSize: 11,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.black54)),
                                                SizedBox(height: 10),
                                                // Spacer(),
                                                Text(e.plot,
                                                    maxLines: 2,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color: Colors.black87)),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: [
                                                    IconButton(
                                                        onPressed:
                                                            () => setState(() {
                                                                  if (!isMovieFavorite(
                                                                      e))
                                                                    favoriteMovies
                                                                        .add(e);
                                                                  else
                                                                    favoriteMovies
                                                                        .removeWhere((m) =>
                                                                            m.id ==
                                                                            e.id);
                                                                }),
                                                        icon: isMovieFavorite(e)
                                                            ? Icon(
                                                                Icons.favorite)
                                                            : Icon(Icons
                                                                .favorite_border))
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  )),
                            ))
                        .toList(),
                  );
                  // log(snap.data.toString());
                } else {
                  log('error');
                }
              }
              return Text('Error');
            }));
  }
}


// import 'dart:convert';
// import 'dart:developer';

// import 'package:first_layout/models/movie.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

// class HomeView extends StatefulWidget {
//   const HomeView({Key? key, required this.title}) : super(key: key);

//   final String title;

//   @override
//   State<HomeView> createState() => _HomeViewState();
// }

// class _HomeViewState extends State<HomeView> {
//   List<Movie> allMovies = [];
//   List<Movie> favoriteMovies = [];

//   Future<List<Movie>> readJson() async {
//     List<Movie> movies = [];
//     final String response = await rootBundle.loadString('assets/movies.json');
//     final data = await json.decode(response);
//     for (var entry in data['movies']) {
//       Movie movie = Movie.fromMap(entry);
//       movies.add(movie);
//     }
//     // await Future.delayed(Duration(seconds: 1));
//     allMovies = movies;
//     return movies;
//   }

//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text(widget.title),
//         ),
//         body: FutureBuilder<List<Movie>>(
//             future: readJson(),
//             builder: (context, snap) {
//               if (snap.connectionState == ConnectionState.waiting)
//                 return Center(child: CircularProgressIndicator());

//               if (snap.connectionState == ConnectionState.done) {
//                 if (snap.hasData) {
//                   return Padding(
//                     padding: const EdgeInsets.all(16.0),
//                     child: GridView(
//                         children: snap.data!
//                             .map((e) => GestureDetector(
//                                   onTap: () => print('tapped'),
//                                   child: Card(
//                                     clipBehavior: Clip.hardEdge,
//                                     shape: RoundedRectangleBorder(
//                                         borderRadius: BorderRadius.circular(8)),
//                                     elevation: 8,
//                                     child: Stack(children: [
//                                       Image.network(
//                                         e.poster,
//                                         width: double.infinity,
//                                         height: 500,
//                                         opacity: AlwaysStoppedAnimation(1),
//                                         fit: BoxFit.cover,
//                                       ),
//                                       Align(
//                                         alignment: Alignment.topLeft,
//                                         child: IconButton(
//                                           icon: Icon(
//                                             Icons.favorite_border,
//                                             size: 50,
//                                           ),
//                                           onPressed: () => print('ads'),
//                                         ),
//                                       ),
//                                       Align(
//                                         alignment: Alignment.bottomCenter,
//                                         child: Opacity(
//                                           opacity: 0.9,
//                                           child: Container(
//                                             width: double.infinity,
//                                             height: 75,
//                                             padding: const EdgeInsets.all(
//                                                 8), // decoration: BoxDecoration(bor)
//                                             color: Colors.black,
//                                             child: Center(
//                                               child: Text(e.title,
//                                                   textAlign: TextAlign.center,
//                                                   maxLines: 2,
//                                                   overflow:
//                                                       TextOverflow.ellipsis,
//                                                   style: TextStyle(
//                                                       fontSize: 20,
//                                                       color: Colors.white70)),
//                                             ),
//                                           ),
//                                         ),
//                                       )
//                                     ]),
//                                   ),
//                                 ))
//                             .toList(),
//                         gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
//                             crossAxisSpacing: 10,
//                             mainAxisSpacing: 10,
//                             maxCrossAxisExtent: 400,
//                             mainAxisExtent: 500)),
//                   );
//                   // log(snap.data.toString());
//                 } else {
//                   log('error');
//                 }
//               }
//               return Text('asd');
//             }));
//   }

  
// }
