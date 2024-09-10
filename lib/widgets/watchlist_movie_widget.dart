import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app_c11/widgets/banner_widget.dart';

class WatchListMovieWidget extends StatelessWidget {
  bool bannerIsDone;
  // double bannerWidth;
  // double bannerHeight;
  String bannerImagePath;
  String movieName;
  String movieReleaseDate;
  String movieStare;
  void Function() bannerOnTab;
  void Function() bookMarkOnTab;
  WatchListMovieWidget({
    super.key,
    required this.bannerIsDone,
    required this.bannerImagePath,
    required this.movieName,
    required this.movieReleaseDate,
    required this.movieStare,
    required this.bannerOnTab,
    required this.bookMarkOnTab,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        BannerWidget(
          isDone: bannerIsDone,
          width: 140,
          height: 89,
          imagePath: bannerImagePath,
          bannerOnTap: bannerOnTab,
          bookMarkOnTap: bookMarkOnTab,
        ),
        const SizedBox(
          width: 5,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              movieName.substring(0, 3),
              style: GoogleFonts.inter(
                fontWeight: FontWeight.w400,
                fontSize: 15,
                color: Colors.white,
              ),
            ),
            Text(
              movieReleaseDate,
              style: GoogleFonts.inter(
                fontWeight: FontWeight.w400,
                fontSize: 13,
                color: Colors.white.withOpacity(.6),
              ),
            ),
            Text(
              movieStare.substring(0, 24),
              style: GoogleFonts.inter(
                fontWeight: FontWeight.w400,
                fontSize: 13,
                color: Colors.white.withOpacity(.6),
              ),
            ),
          ],
        )
      ],
    );
  }
}
