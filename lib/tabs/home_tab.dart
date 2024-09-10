import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app_c11/api/api.dart';
import 'package:movie_app_c11/firebase/firebase_function.dart';
import 'package:movie_app_c11/models/movie_model.dart';
import 'package:movie_app_c11/tabs/watchlist_tab.dart';
import 'package:movie_app_c11/views/movie_details_view.dart';
import 'package:movie_app_c11/widgets/banner_widget.dart';
import 'package:movie_app_c11/widgets/detailed_banner_widget.dart';
import 'package:movie_app_c11/widgets/movie_item_widget.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  bool newReleaseIsSaved = false;
  bool recommendedIsSaved = false;
  bool slidIsSaved = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: SingleChildScrollView(
        child: Column(
          children: [
            FutureBuilder(
              future: Api.getPopularMovie(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const SizedBox(
                      height: 289,
                      width: 455.62,
                      child: Center(child: CircularProgressIndicator()));
                } else if (snapshot.hasError) {
                  return const Center(child: Text("Something went wrong"));
                }
                MovieModel movieModel = snapshot.data!;

                return CarouselSlider(
                  options: CarouselOptions(
                    viewportFraction: .9,
                    height: 289,
                    autoPlay: true,
                  ),
                  items: movieModel.results!.map((i) {
                    return Builder(
                      builder: (BuildContext context) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const SizedBox(
                              height: 187,
                              width: 455.62,
                              child:
                                  Center(child: CircularProgressIndicator()));
                        } else if (snapshot.hasError) {
                          return const Center(
                              child: Text("Something went wrong"));
                        }
                        return Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: MovieItemWidget(
                            movieVideoPath:
                                "${Api.baseImageUrl}${i.backdropPath}",
                            bannerPath: "${Api.baseImageUrl}${i.backdropPath}",
                            movieDescription: i.title ?? '',
                            movieRelease: i.releaseDate ?? '',
                            bannerIsDone: false,
                            bookMarkTapBanner: () {
                              FirebaseFunction.addMovie(
                                results: i,
                              );
                            },
                            onPressedMovieVideo: () {},
                            onTapBanner: () {
                              Navigator.pushNamed(
                                  context, MovieDetailsView.routName);
                            },
                          ),
                        );
                      },
                    );
                  }).toList(),
                );
              },
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              //
              width: 455.62,
              height: 187,
              color: const Color(0XFF282A28),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        " New Releases ",
                        style: GoogleFonts.inter(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FutureBuilder(
                        future: Api.getNewReleaseMovies(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                                child: CircularProgressIndicator());
                          } else if (snapshot.hasError) {
                            return Text(
                              "Something Went Wrong",
                              style: GoogleFonts.inter(
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                              ),
                            );
                          }

                          var movieModel = snapshot.data;

                          return SizedBox(
                            height: 127.74,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: movieModel?.results!.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: BannerWidget(
                                      height: 127.74,
                                      width: 96.87,
                                      bookMarkOnTap: () {
                                        FirebaseFunction.addMovie(
                                          results: movieModel.results![index],
                                        );
                                      },
                                      isDone: false,
                                      imagePath:
                                          "${Api.baseImageUrl}${movieModel!.results![index].backdropPath}",
                                      bannerOnTap: () {
                                        Navigator.pushNamed(
                                          context,
                                          MovieDetailsView.routName,
                                          arguments: movieModel.results![index],
                                        );
                                      },
                                    ),
                                  );
                                }),
                          );
                        }),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Container(
              width: 434,
              height: 246,
              padding: const EdgeInsets.all(8),
              // margin: EdgeInsets.all(8),
              color: const Color(0XFF282A28),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Recommended",
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.w400,
                        fontSize: 15,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  FutureBuilder(
                    future: Api.getTopRatedMovie(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const SizedBox(
                            height: 187,
                            width: 455.62,
                            child: Center(child: CircularProgressIndicator()));
                      } else if (snapshot.hasError) {
                        return const Center(
                            child: Text("Something went wrong"));
                      }
                      MovieModel movieModel = snapshot.data!;
                      return Expanded(
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: movieModel.results!.length,
                          itemBuilder: (context, index) => Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: DetailedBannerWidget(
                              bookMarkOnTap: () {
                                FirebaseFunction.addMovie(
                                  results: movieModel.results![index],
                                );
                              },
                              bannerOnTap: () {
                                Navigator.pushNamed(
                                  context,
                                  MovieDetailsView.routName,
                                  arguments: movieModel.results![index],
                                );
                              },
                              isDone: false,
                              imagePath:
                                  "${Api.baseImageUrl}${movieModel.results![index].backdropPath}",
                              movieDuration:
                                  movieModel.results![index].releaseDate ?? '',
                              movieName: movieModel.results![index].title ?? '',
                              movieRate: movieModel.results![index].voteAverage
                                  .toString(),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool isBookMarked(
      {required Results movie, required List<Results> savedMovies}) {
    for (int i = 0; i < savedMovies.length; i++) {
      if (movie == savedMovies[i].id) {
        return true;
      }
    }
    return false;
  }
  // bool isBookMarked(
  //     {required Results movie, required List<Results> savedMovies}) {
  //   for (var movie in savedMovies) {
  //     return true;
  //   }
  //   return false;
  // }
}
