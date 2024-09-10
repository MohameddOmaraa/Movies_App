import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movie_app_c11/models/movie_list_model.dart';
import 'package:movie_app_c11/models/movie_model.dart';

class Api {
  static const String baseImageUrl = "https://image.tmdb.org/t/p/w500/";
  static Future<MovieModel> getPopularMovie() async {
    Uri url = Uri.https(
      "api.themoviedb.org",
      "/3/discover/movie",
      {
        "api_key": "232f32895803b83d8683bab61b60814d",
      },
    );
    http.Response response = await http.get(url);

    Map<String, dynamic> json = jsonDecode(response.body);

    MovieModel movieModel = MovieModel.fromJson(json);

    return movieModel;
  }

  static Future<MovieModel> getMovieByCategory(String genreId) async {
    Uri url = Uri.https(
      "api.themoviedb.org",
      "/3/discover/movie",
      {
        "api_key": "232f32895803b83d8683bab61b60814d",
        "with_genres": genreId,
      },
    );
    http.Response response = await http.get(url);

    Map<String, dynamic> json = jsonDecode(response.body);

    MovieModel movieModel = MovieModel.fromJson(json);

    return movieModel;
  }

  static Future<MovieModel> getNewReleaseMovies() async {
    Uri url = Uri.https(
      "api.themoviedb.org",
      "/3/movie/upcoming",
      {
        "api_key": "232f32895803b83d8683bab61b60814d",
      },
    );
    http.Response response = await http.get(url);

    Map<String, dynamic> json = jsonDecode(response.body);

    MovieModel movieModel = MovieModel.fromJson(json);

    return movieModel;
  }

  static Future<MovieModel> getTopRatedMovie() async {
    Uri url = Uri.https("api.themoviedb.org", "/3/movie/top_rated", {
      "api_key": "232f32895803b83d8683bab61b60814d",
    });
    http.Response response = await http.get(url);

    Map<String, dynamic> json = jsonDecode(response.body);

    MovieModel movieModel = MovieModel.fromJson(json);

    return movieModel;
  }

  static Future<MovieModel> getSimilarMovie(int id) async {
    Uri url = Uri.https("api.themoviedb.org", "/3/movie/$id/similar", {
      "api_key": "232f32895803b83d8683bab61b60814d",
    });
    http.Response response = await http.get(url);

    Map<String, dynamic> json = jsonDecode(response.body);

    MovieModel movieModel = MovieModel.fromJson(json);

    return movieModel;
  }

  static Future<MovieListModel> getMovieCategory() async {
    Uri url = Uri.https(
      "api.themoviedb.org",
      "/3/genre/movie/list",
      {
        "api_key": "232f32895803b83d8683bab61b60814d",
      },
    );
    http.Response response = await http.get(url);

    Map<String, dynamic> json = jsonDecode(response.body);

    MovieListModel movieListModel = MovieListModel.fromJson(json);

    return movieListModel;
  }

  static Future<MovieModel> searchMovie(String movieName) async {
    Uri url = Uri.https(
      "api.themoviedb.org",
      "/3/search/movie",
      {
        "api_key": "232f32895803b83d8683bab61b60814d",
        "query": movieName,
      },
    );
    http.Response response = await http.get(url);

    Map<String, dynamic> json = jsonDecode(response.body);

    MovieModel movieModel = MovieModel.fromJson(json);

    return movieModel;
  }
}
