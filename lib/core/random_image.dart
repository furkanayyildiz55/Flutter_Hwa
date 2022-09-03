import 'package:flutter/material.dart';

class RandonImage extends StatelessWidget {
  const RandonImage({Key? key, this.height=100}) : super(key: key);
  final ImageUrl = "https://picsum.photos/200/300";
  final double height;

  @override
  Widget build(BuildContext context) {
    return Image.network(
      ImageUrl,
      height: height,
      fit: BoxFit.cover,
    );
  }
}
