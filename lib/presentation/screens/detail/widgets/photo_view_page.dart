import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

import '../../../widgets/primary_app_bar.dart';

class PhotoViewPage extends StatelessWidget {
  const PhotoViewPage({
    required this.image,
    required this.title,
  });
  final String image, title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrimaryAppBar(label: title),
      body: PhotoView(
        imageProvider: CachedNetworkImageProvider(image),
        backgroundDecoration: const BoxDecoration(
          color: Colors.transparent,
        ),
      ),
    );
  }
}
