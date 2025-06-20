import 'package:flutter/material.dart';
import 'action_floating_button.dart';

class ImageDetailScreen extends StatelessWidget {
  final String imageUrl;

  ImageDetailScreen({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Image Detail"),
      ),
      body: Column(
        children: [
          Hero(
            tag: imageUrl,
            child: Image.network(imageUrl),
          ),
          Expanded(
            child: ActionFloatingButton(imageUrl: imageUrl),
          ),
        ],
      ),
    );
  }
}

