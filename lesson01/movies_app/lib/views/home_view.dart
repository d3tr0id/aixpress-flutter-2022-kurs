import 'dart:convert';
import 'dart:developer';

import 'package:first_layout/models/movie.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<Movie> allMovies = [];
  List<Movie> favoriteMovies = [];

  Future<List<Movie>> readJson() async {
    List<Movie> movies = [];
    final String response = await rootBundle.loadString('assets/movies.json');
    final data = await json.decode(response);
    for (var entry in data['movies']) {
      Movie movie = Movie.fromMap(entry);
      movies.add(movie);
    }
    // await Future.delayed(Duration(seconds: 1));
    allMovies = movies;
    return movies;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: FutureBuilder<List<Movie>>(
            future: readJson(),
            builder: (context, snap) {
              if (snap.connectionState == ConnectionState.waiting)
                return Center(child: CircularProgressIndicator());

              if (snap.connectionState == ConnectionState.done) {
                if (snap.hasData) {
                  return Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: GridView(
                        children: snap.data!
                            .map((e) => GestureDetector(
                                  onTap: () => print('tapped'),
                                  child: Card(
                                    clipBehavior: Clip.hardEdge,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8)),
                                    elevation: 8,
                                    child: Column(children: [
                                      Expanded(
                                        flex: 4,
                                        child: Image.network(
                                          e.poster,
                                          width: double.infinity,
                                          // height: 500,
                                          opacity: AlwaysStoppedAnimation(1),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 16.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Expanded(
                                                flex: 3,
                                                child: Text(e.title,
                                                    maxLines: 2,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: TextStyle(
                                                        fontSize: 24,
                                                        color: Colors.white70)),
                                              ),
                                              Expanded(
                                                child: IconButton(
                                                  splashRadius: 30,
                                                  padding:
                                                      const EdgeInsets.all(0),
                                                  icon: Icon(
                                                    Icons.favorite_border,
                                                    size: 40,
                                                  ),
                                                  onPressed: () => print('ads'),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      )
                                    ]),
                                  ),
                                ))
                            .toList(),
                        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                            maxCrossAxisExtent: 400,
                            mainAxisExtent: 500)),
                  );
                  // log(snap.data.toString());
                } else {
                  log('error');
                }
              }
              return Text('asd');
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
