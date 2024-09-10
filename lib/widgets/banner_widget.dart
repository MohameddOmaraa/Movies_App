import 'package:flutter/material.dart';

class BannerWidget extends StatelessWidget {
  final String imagePath;
  final void Function() bannerOnTap;
  final void Function() bookMarkOnTap;
  final double width;
  final double height;
  final bool isDone;
  const BannerWidget({
    super.key,
    required this.imagePath,
    required this.bannerOnTap,
    required this.bookMarkOnTap,
    required this.width,
    required this.height,
    required this.isDone,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(
            imagePath,
          ),
        ),
      ),
      child: InkWell(
        onTap: bannerOnTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: bookMarkOnTap,
              child: Image.asset(
                isDone
                    ? "assets/images/done_bookmark.png"
                    : "assets/images/add_bookmark.png",
                alignment: Alignment.topLeft,
                width: 27,
                height: 36,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
