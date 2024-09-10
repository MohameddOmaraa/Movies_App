import 'package:flutter/material.dart';
import 'package:movie_app_c11/views/bottom_navigation_bar_view.dart';

class SplashView extends StatefulWidget {
  static const String routName = "SplashView";
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 4), () {
      Navigator.pushReplacementNamed(context, BottomNavigationBarView.routName);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Image.asset(
        "assets/images/supervised.png",
        alignment: Alignment.bottomCenter,
      ),
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Image.asset("assets/images/splash_view.png")),
        ],
      ),
    );
  }
}
