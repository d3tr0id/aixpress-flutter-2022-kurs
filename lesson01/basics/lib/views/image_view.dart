import 'package:flutter/material.dart';
/**
 * load aixpress image Image.asset
 * Image.network
 * Scaling, DecorationImage, BoxShape.circle
 */

class ImageView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage('assets/images/aixpress.png')),
              shape: BoxShape.circle,
              color: Colors.red),
        ),
      ),
    );
  }
}
