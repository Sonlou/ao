import 'package:flutter/material.dart';
import 'image_detail_screen.dart';

class ImageGrid extends StatelessWidget {
  final List<String> imageUrls;

  ImageGrid({required this.imageUrls});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.75,
      ),
      itemCount: imageUrls.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(
              builder: (context) => ImageDetailScreen(imageUrl: imageUrls[index]),
            ));
          },
          child: Hero(
            tag: imageUrls[index],
            child: Image.network(imageUrls[index], fit: BoxFit.cover),
          ),
        );
      },
    );
  }
}

