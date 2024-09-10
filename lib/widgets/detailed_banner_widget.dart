import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app_c11/widgets/banner_widget.dart';

class DetailedBannerWidget extends StatelessWidget {
  final bool isDone;
  final String imagePath;
  final String movieRate;
  final String movieName;
  final String movieDuration;
  final void Function() bannerOnTap;
  final void Function() bookMarkOnTap;
  const DetailedBannerWidget({
    super.key,
    required this.isDone,
    required this.imagePath,
    required this.movieRate,
    required this.movieName,
    required this.movieDuration,
    required this.bannerOnTap,
    required this.bookMarkOnTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BannerWidget(
          isDone: isDone,
          width: 96.87,
          height: 127.74,
          imagePath: imagePath,
          bannerOnTap: bannerOnTap,
          bookMarkOnTap: bookMarkOnTap,
        ),
        Row(
          children: [
            const Icon(
              Icons.star_rate_rounded,
              color: Colors.yellow,
            ),
            Text(
              movieRate,
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w400,
                fontSize: 10,
                color: Colors.white,
              ),
            ),
          ],
        ),
        Text(
          "  $movieName",
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w400,
            fontSize: 10,
            color: Colors.white,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          "   $movieDuration",
          style: GoogleFonts.inter(
            fontWeight: FontWeight.w400,
            fontSize: 8,
            color: const Color(0XFFB5B4B4),
          ),
        ),
      ],
    );
  }
}
