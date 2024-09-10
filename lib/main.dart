import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:movie_app_c11/firebase_options.dart';
import 'package:movie_app_c11/views/bottom_navigation_bar_view.dart';
import 'package:movie_app_c11/views/movie_browse_details.dart';
import 'package:movie_app_c11/views/movie_details_view.dart';
import 'package:movie_app_c11/views/splash_view.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MovieAppC());
}

class MovieAppC extends StatelessWidget {
  const MovieAppC({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: SplashView.routName,
      routes: routes,
    );
  }

  Map<String, WidgetBuilder> get routes {
    return {
      SplashView.routName: (context) => SplashView(),
      BottomNavigationBarView.routName: (context) => BottomNavigationBarView(),
      MovieDetailsView.routName: (context) => MovieDetailsView(),
      MovieBrowseDetails.routName: (context) => MovieBrowseDetails(),
    };
  }
}
