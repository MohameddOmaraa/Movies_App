import 'package:flutter/material.dart';
import 'package:movie_app_c11/api/api.dart';
import 'package:movie_app_c11/widgets/watchlist_movie_widget.dart';

class MovieBrowseDetails extends StatelessWidget {
  static const routName = "MovieBrowseDetails";
  const MovieBrowseDetails({super.key});

  @override
  Widget build(BuildContext context) {
    var genreId = ModalRoute.of(context)!.settings.arguments as int;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
      ),
      body: FutureBuilder(
        future: Api.getMovieByCategory(genreId.toString()),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const SizedBox(
                height: double.infinity,
                width: double.infinity,
                child: Center(
                    child: CircularProgressIndicator(
                  color: Colors.white,
                )));
          } else if (snapshot.hasError) {
            return const Center(child: Text("Something went wrong"));
          }

          var movieModel = snapshot.data;

          return ListView.separated(
            separatorBuilder: (context, index) => const Divider(
              indent: 30,
              endIndent: 30,
            ),
            itemCount: movieModel!.results!.length,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: WatchListMovieWidget(
                bannerImagePath:
                    '${Api.baseImageUrl}${movieModel!.results![index].backdropPath}',
                movieName: '${movieModel!.results![index].title}',
                movieReleaseDate: '${movieModel!.results![index].releaseDate}',
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
}
