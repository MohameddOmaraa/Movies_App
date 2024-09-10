import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app_c11/api/api.dart';
import 'package:movie_app_c11/firebase/firebase_function.dart';
import 'package:movie_app_c11/models/movie_model.dart';
import 'package:movie_app_c11/widgets/watchlist_movie_widget.dart';

List<Results> savedMovies = [];

class WatchlistTab extends StatefulWidget {
  const WatchlistTab({super.key});

  @override
  State<WatchlistTab> createState() => _WatchlistTabState();
}

class _WatchlistTabState extends State<WatchlistTab> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      color: Colors.black,
      width: double.infinity,
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Watchlist",
              style: GoogleFonts.inter(
                fontSize: 22,
                fontWeight: FontWeight.w400,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          StreamBuilder(
            stream: FirebaseFunction.getMovies(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const SizedBox(
                    height: 289,
                    width: 455.62,
                    child: Center(child: CircularProgressIndicator()));
              } else if (snapshot.hasError) {
                return const Center(child: Text("Something went wrong"));
              }

              // Check if there is any data in the snapshot
              if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                return const Center(
                  child: Text(
                    "No movies in your watchlist",
                    style: TextStyle(color: Colors.white),
                  ),
                );
              }

              // Extract the movieModel list from Firestore snapshot
              var resultsList =
                  snapshot.data?.docs.map((doc) => doc.data()).toList();

              return Expanded(
                child: ListView.separated(
                  separatorBuilder: (context, index) => const Divider(
                    indent: 30,
                    endIndent: 30,
                    color: Colors.white, // For better visibility
                  ),
                  itemCount:
                      resultsList!.length, // Ensure movieModel is not null
                  itemBuilder: (context, index) {
                    // Safely access movie data

                    return WatchListMovieWidget(
                      bannerImagePath:
                          '${Api.baseImageUrl}${resultsList![index].backdropPath}',
                      movieName: '${resultsList[index].title!}',
                      movieReleaseDate: '${resultsList[index].releaseDate}',
                      movieStare: 'Rosa Salazar, Christoph Waltz',
                      bannerIsDone: true,
                      bannerOnTab: () {},
                      bookMarkOnTab: () async {
                        if (resultsList[index].firestoreId != null) {
                          await FirebaseFunction.deleteMovie(
                              resultsList[index].firestoreId!);
                        } else {
                          print("Error: Firestore ID is null for this movie");
                          print(resultsList[index].id);
                        }
                      },
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
