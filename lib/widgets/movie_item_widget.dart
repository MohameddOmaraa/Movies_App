import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app_c11/widgets/banner_widget.dart';
import 'package:movie_app_c11/widgets/movie_video_widget.dart';

class MovieItemWidget extends StatelessWidget {
  final String movieVideoPath;
  final String bannerPath;
  final String movieDescription;
  final String movieRelease;
  final bool bannerIsDone;
  final void Function() onPressedMovieVideo;
  final void Function() onTapBanner;
  final void Function() bookMarkTapBanner;

  const MovieItemWidget({
    super.key,
    required this.movieVideoPath,
    required this.bannerPath,
    required this.movieDescription,
    required this.movieRelease,
    required this.onPressedMovieVideo,
    required this.onTapBanner,
    required this.bookMarkTapBanner,
    required this.bannerIsDone,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 412,
      height: 289,
      color: Colors.black,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.topCenter,
        children: [
          MovieVideoWidget(
            imagePath: movieVideoPath,
            onPressed: onPressedMovieVideo,
          ),
          Positioned(
            left: 0,
            bottom: 0,
            child: BannerWidget(
              bookMarkOnTap: bookMarkTapBanner,
              isDone: bannerIsDone,
              width: 129,
              height: 199,
              imagePath: bannerPath,
              bannerOnTap: onTapBanner,
            ),
          ),
          Positioned(
            top: 235,
            left: 164,
            child: Column(
              children: [
                Text(
                  movieDescription,
                  style: GoogleFonts.inter(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  movieRelease,
                  style: GoogleFonts.inter(
                    color: const Color(0XFFB5B4B4),
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
