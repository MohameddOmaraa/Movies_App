import 'package:flutter/material.dart';

class MovieVideoWidget extends StatelessWidget {
  final String imagePath;
  final void Function() onPressed;
  const MovieVideoWidget({
    super.key,
    required this.imagePath,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 412,
      height: 217,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
            imagePath,
          ),
        ),
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: const Icon(
          Icons.play_circle,
          size: 60,
          color: Colors.white,
        ),
      ),
    );
  }
}
