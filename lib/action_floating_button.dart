import 'package:flutter/material.dart';
import 'package:image_downloader/image_downloader.dart';
import 'package:wallpaper_manager_flutter/wallpaper_manager_flutter.dart';

class ActionFloatingButton extends StatelessWidget {
  final String imageUrl;

  ActionFloatingButton({required this.imageUrl});

  Future<void> _downloadImage() async {
    try {
      final imageId = await ImageDownloader.downloadImage(imageUrl);
      if (imageId == null) {
        return;
      }
      print('Image downloaded successfully: $imageId');
    } catch (error) {
      print('Failed to download image: $error');
    }
  }

  Future<void> _setWallpaper() async {
    try {
      await WallpaperManagerFlutter().setWallpaper(
        url: imageUrl,
        location: WallpaperManagerFlutter.HOME_SCREEN,
      );
      print('Wallpaper set successfully');
    } catch (error) {
      print('Failed to set wallpaper: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        FloatingActionButton(
          heroTag: 'download',
          onPressed: _downloadImage,
          child: Icon(Icons.download),
        ),
        SizedBox(height: 10),
        FloatingActionButton(
          heroTag: 'setWallpaper',
          onPressed: _setWallpaper,
          child: Icon(Icons.wallpaper),
        ),
      ],
    );
  }
}

