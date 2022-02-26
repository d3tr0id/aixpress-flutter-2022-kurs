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
        decoration: BoxDecoration(shape: BoxShape.circle),
      )),
    );
  }
}
