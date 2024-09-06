import 'package:flutter/material.dart';

class BackgroundImage extends StatelessWidget {
  const BackgroundImage(this.text, {this.imageUrl, super.key});
  final String text;
  final String? imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200,
      decoration: BoxDecoration(
        image: DecorationImage(
              image: NetworkImage(imageUrl!),
              fit: BoxFit.cover
          ),
      ),
    );
  }
}
