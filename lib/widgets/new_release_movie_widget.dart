import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app_c11/api/api.dart';
import 'package:movie_app_c11/models/movie_model.dart';
import 'package:movie_app_c11/widgets/banner_widget.dart';

class NewReleaseMovieWidget extends StatelessWidget {
  List<Results> results;
  bool bannerIsDone;
  void Function() bookMarkOnTap;
  void Function() bannerOnTap;

  NewReleaseMovieWidget({
    super.key,
    required this.bannerIsDone,
    required this.bookMarkOnTap,
    required this.bannerOnTap,
    required this.results,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: results.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: BannerWidget(
                    bookMarkOnTap: bookMarkOnTap,
                    isDone: bannerIsDone,
                    width: 96.87,
                    height: 127.74,
                    imagePath:
                        "${Api.baseImageUrl}${results[index].backdropPath}",
                    bannerOnTap: bannerOnTap,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
