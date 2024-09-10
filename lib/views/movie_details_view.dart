import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app_c11/api/api.dart';
import 'package:movie_app_c11/models/movie_model.dart';
import 'package:movie_app_c11/widgets/banner_widget.dart';
import 'package:movie_app_c11/widgets/detailed_banner_widget.dart';
import 'package:movie_app_c11/widgets/movie_video_widget.dart';

class MovieDetailsView extends StatelessWidget {
  static const String routName = "MovieDetailsView";
  const MovieDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    var result = ModalRoute.of(context)!.settings.arguments as Results;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0XFFD1E1D),
        centerTitle: true,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        title: Text(
          result.title!,
          style: GoogleFonts.inter(
            fontSize: 20,
            fontWeight: FontWeight.w400,
            color: Colors.white,
          ),
        ),
      ),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 25,
            ),
            MovieVideoWidget(
              imagePath: "${Api.baseImageUrl}${result.backdropPath}",
              onPressed: () {},
            ),
            const SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  result.title!,
                  style: GoogleFonts.inter(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "${result.releaseDate}  2h 7m",
                  style: GoogleFonts.inter(
                    color: const Color(0XFFB5B4B4),
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                BannerWidget(
                  isDone: false,
                  width: 129,
                  height: 199,
                  imagePath: "${Api.baseImageUrl}${result.backdropPath}",
                  bannerOnTap: () {},
                  bookMarkOnTap: () {},
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        MovieType(
                          movieType: 'Action',
                        ),
                        MovieType(
                          movieType: 'Action',
                        ),
                        MovieType(
                          movieType: 'Action',
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 250,
                      child: Text(
                        result.overview!,
                        maxLines: 5,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.w400,
                          fontSize: 13,
                          color: const Color(0XFFCBCBCB),
                        ),
                      ),
                    ),
                    Row(
                      // mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Icon(
                          Icons.star_rate_rounded,
                          color: Colors.yellow,
                          size: 30,
                        ),
                        Text(
                          result.voteAverage.toString(),
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w400,
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            ///////////////// MoreLikeThisWidget ???????
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
                      future: Api.getSimilarMovie(result.id!),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const SizedBox(
                            height: 127.74,
                            child: Center(child: CircularProgressIndicator()),
                          );
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
                        return Expanded(
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 10,
                            itemBuilder: (context, index) => Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 4),
                              child: DetailedBannerWidget(
                                bannerOnTap: () {},
                                bookMarkOnTap: () {},
                                isDone: true,
                                imagePath:
                                    "${Api.baseImageUrl}${movieModel!.results![index].backdropPath}",
                                movieDuration:
                                    "${movieModel.results![index].releaseDate!.substring(0, 3)}  R  1h 59m",
                                movieName:
                                    "${movieModel.results![index].title}",
                                movieRate:
                                    "${movieModel.results![index].voteAverage}",
                              ),
                            ),
                          ),
                        );
                      }),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class MovieType extends StatelessWidget {
  String movieType;
  MovieType({
    super.key,
    required this.movieType,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 65,
      height: 25,
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        // border: 1px solid #514F4F
        border: Border.all(
          color: Color(0XFF514F4F),
        ),
      ),
      child: Center(
        child: Text(
          movieType,
          style: GoogleFonts.inter(
            fontWeight: FontWeight.w400,
            fontSize: 10,
            color: const Color(0XFFCBCBCB),
          ),
        ),
      ),
    );
  }
}
