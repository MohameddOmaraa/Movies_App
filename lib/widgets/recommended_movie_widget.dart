import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app_c11/api/api.dart';
import 'package:movie_app_c11/models/movie_model.dart';
import 'package:movie_app_c11/widgets/detailed_banner_widget.dart';

class RecommendedMovieWidget extends StatelessWidget {
  List<Results> results;

  bool bannerIsDone;
  void Function() bookMarkOnTap;
  void Function() bannerOnTap;
  RecommendedMovieWidget({
    super.key,
    required this.bannerOnTap,
    required this.bannerIsDone,
    required this.bookMarkOnTap,
    required this.results,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: results.length,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: DetailedBannerWidget(
                  bookMarkOnTap: bookMarkOnTap,
                  bannerOnTap: bannerOnTap,
                  isDone: bannerIsDone,
                  imagePath:
                      "${Api.baseImageUrl}${results[index].backdropPath}",
                  movieDuration: results[index].releaseDate ?? '',
                  movieName: results[index].title ?? '',
                  movieRate: results[index].voteAverage.toString(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
