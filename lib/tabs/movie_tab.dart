import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app_c11/api/api.dart';
import 'package:movie_app_c11/models/movie_list_model.dart';
import 'package:movie_app_c11/views/movie_browse_details.dart';

class MovieTab extends StatelessWidget {
  const MovieTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.only(top: 15),
      width: double.infinity,
      color: Colors.black,
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Browse Category ",
              // textAlign: TextAlign.start,
              style: GoogleFonts.inter(
                fontSize: 22,
                fontWeight: FontWeight.w400,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          FutureBuilder(
              future: Api.getMovieCategory(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: SizedBox(
                      height: 300,
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
                  );
                } else if (snapshot.hasError) {
                  return const Text("something Went Wrong");
                }

                var category = snapshot.data;

                return Expanded(
                  child: GridView.builder(
                    itemCount:
                        category!.genres!.length, // Number of items in the grid
                    itemBuilder: (context, index) {
                      print("########### ${category.genres![index].name}");
                      return InkWell(
                        onTap: () {
                          Navigator.pushNamed(
                              context, MovieBrowseDetails.routName,
                              arguments: category.genres![index].id);
                        },
                        child: Container(
                          width: 158,
                          height: 90,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                newMethod(category, index),
                              ),
                            ),
                          ),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              "${category.genres![index].name}",
                              style: GoogleFonts.inter(
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      );
                    },

                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, // Number of columns
                      crossAxisSpacing: 8.0, // Horizontal spacing between items
                      mainAxisSpacing: 8.0, // Vertical spacing between items
                      childAspectRatio:
                          158 / 90, // Width to height ratio of each item
                    ),
                  ),
                );
              })
        ],
      ),
    );
  }

  String newMethod(MovieListModel category, int index) {
    return switch (category.genres?[index].name) {
      "Action" => "assets/images/category/Action.jpg",
      "Adventure" => "assets/images/category_2/Adventure.jpg",
      "Animation" => "assets/images/category_2/Animation.jpg",
      "Comedy" => "assets/images/category_2/Comedy.jpg",
      "Crime" => "assets/images/category_2/Crime.jpg",
      "Documentary" => "assets/images/category_2/Documentary.jpg",
      "Drama" => "assets/images/category_2/Drama.jpg",
      "Family" => "assets/images/category_2/Family.jpg",
      "Fantasy" => "assets/images/category_2/Fantasy.jpg",
      "History" => "assets/images/category_2/History.jpg",
      "Horror" => "assets/images/category_2/Horror.jpg",
      "Music" => "assets/images/category_2/Music.jpg",
      "Mystery" => "assets/images/category_2/Mystery.jpg",
      "Romance" => "assets/images/category_2/Romance.jpg",
      "Science Fiction" => "assets/images/category_2/Science Fiction.jpg",
      "TV Movie" => "assets/images/category_2/TV Movie.jpg",
      "Thriller" => "assets/images/category_2/Thriller.jpg",
      "War" => "assets/images/category_2/War.jpg",
      "Western" => "assets/images/category_2/Western.jpg",
      "Default" => "assets/images/category_2/Default.jpg",
      String() => "assets/images/category_2/Crime.jpg",
      null => "assets/images/category_2/Crime.jpg",
    };
  }
}
