import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app_c11/views/movie_details_view.dart';
import 'package:movie_app_c11/widgets/detailed_banner_widget.dart';

class MoreLikeThisWidget extends StatelessWidget {
  const MoreLikeThisWidget({
    super.key,
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
              itemCount: 10,
              itemBuilder: (context, index) => DetailedBannerWidget(
                bannerOnTap: () {},
                bookMarkOnTap: () {},
                isDone: true,
                imagePath: "assets/images/banner.png",
                movieDuration: "2018  R  1h 59m",
                movieName: "Deadpool 2",
                movieRate: "7.7",
              ),
            ),
          ),
        ],
      ),
    );
  }
}
