import 'package:flutter/material.dart';
import 'package:movie_app_c11/tabs/home_tab.dart';
import 'package:movie_app_c11/tabs/movie_tab.dart';
import 'package:movie_app_c11/tabs/search_tab.dart';
import 'package:movie_app_c11/tabs/watchlist_tab.dart';

class BottomNavigationBarView extends StatefulWidget {
  static const String routName = "HomeView";

  BottomNavigationBarView({super.key});

  @override
  State<BottomNavigationBarView> createState() =>
      _BottomNavigationBarViewState();
}

class _BottomNavigationBarViewState extends State<BottomNavigationBarView> {
  int selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: tabs[selectedTab],
      bottomNavigationBar: BottomNavigationBar(
        // backgroundColor: Color(0XFF1A1A1A),
        selectedItemColor: Colors.yellow,
        unselectedItemColor: Colors.white,
        type: BottomNavigationBarType.shifting,
        currentIndex: selectedTab,
        selectedLabelStyle: TextStyle(color: Colors.yellow),
        unselectedLabelStyle: TextStyle(color: Colors.white),
        showUnselectedLabels: true,
        onTap: (value) {
          selectedTab = value;
          setState(() {});
        },
        items: const [
          BottomNavigationBarItem(
            backgroundColor: Color(0XFF1A1A1A),
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            backgroundColor: Color(0XFF1A1A1A),
            icon: Icon(Icons.search),
            label: "Search",
          ),
          BottomNavigationBarItem(
            backgroundColor: Color(0XFF1A1A1A),
            icon: Icon(Icons.movie),
            label: "Movie",
          ),
          BottomNavigationBarItem(
            backgroundColor: Color(0XFF1A1A1A),
            icon: Icon(Icons.collections_bookmark),
            label: "Watchlist",
          ),
        ],
      ),
    );
  }

  List<Widget> tabs = [HomeTab(), SearchTab(), MovieTab(), WatchlistTab()];
}
