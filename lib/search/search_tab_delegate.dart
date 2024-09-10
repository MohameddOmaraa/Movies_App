import 'package:flutter/material.dart';
import 'package:movie_app_c11/api/api.dart';
import 'package:movie_app_c11/widgets/watchlist_movie_widget.dart';

class SearchTabDelegate extends SearchDelegate {
  @override
  ThemeData appBarTheme(BuildContext context) {
    return ThemeData(
      appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xFF514F4F),
      ),
      inputDecorationTheme: const InputDecorationTheme(
        border: InputBorder.none,
      ),
    );
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          if (query.isNotEmpty) {
            query = '';
          } else {
            close(context, null);
          }
        },
        icon: const Icon(
          Icons.clear,
          color: Colors.black,
        ),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(
        Icons.arrow_back,
        color: Colors.black,
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      color: Colors.black,
      child: FutureBuilder(
        future: Api.searchMovie(query),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            );
          } else if (snapshot.hasError) {
            return const Center(
              child: Text(
                "Something went wrong",
                style: TextStyle(color: Colors.white),
              ),
            );
          }
          var movieModel = snapshot.data;

          if (movieModel == null || movieModel.results!.isEmpty) {
            return Center(
              child: Image.asset("assets/images/no_movie_found.png"),
            );
          }

          return ListView.separated(
            separatorBuilder: (context, index) => const Divider(
              indent: 30,
              endIndent: 30,
              color: Colors.white,
            ),
            itemCount: movieModel.results!.length,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: WatchListMovieWidget(
                bannerImagePath:
                    '${Api.baseImageUrl}${movieModel.results![index].backdropPath}',
                movieName: '${movieModel.results![index].title}',
                movieReleaseDate: '${movieModel.results![index].releaseDate}',
                movieStare: 'Rosa Salazar, Christoph Waltz',
                bannerIsDone: true,
                bannerOnTab: () {},
                bookMarkOnTab: () {},
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container(
      color: Colors.black,
    );
  }
}
