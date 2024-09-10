import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              height: 289,
              width: 412,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/Move_Image.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(110.0),
              child: Center(
                child: ImageIcon(
                  AssetImage("assets/images/play-button.png"),
                  color: Colors.white,
                  size: 60,
                ),
              ),
            ),
          ],
        ),
        Container(
          width: 420,
          height: 100,
          color: Colors.black,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Dora and the lost city of gold",
                      style: GoogleFonts.inder(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Colors.white),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "2019  PG-13  2h 7m",
                      style: GoogleFonts.inder(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Colors.grey),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),

        // ),

        Container(
          width: 455.62,
          height: 187,
          color: const Color(0xFF282A28),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "New Releases ",
                  style: GoogleFonts.inder(
                      fontWeight: FontWeight.w400,
                      fontSize: 15,
                      color: Colors.white),
                ),
              ),
              ListView.builder(
                  itemCount: 10,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Stack(
                        children: [
                          Image.asset(
                            "assets/images/NARCOS.png",
                            width: 96.87,
                            height: 127.74,
                          ),
                          const Positioned(
                            height: 36,
                            width: 27,
                            child: ImageIcon(
                              AssetImage(
                                  "assets/images/Icon awesome-bookmark .png"),
                              color: Colors.grey,
                            ),
                          ),
                          const Positioned(
                            width: 11.04,
                            height: 11.04,
                            child: Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
            ],
          ),
        ),

        const SizedBox(
          height: 40,
        ),
        Container(
          height: 187,
          width: double.infinity,
          color: const Color(0xFF282A28),
          child: Image.asset(
            "assets/images/NARCOS.png",
          ),
        ),
      ],
    );
  }
}
