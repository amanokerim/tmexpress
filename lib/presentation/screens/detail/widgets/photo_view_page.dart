import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart' hide Image;
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import '../../../../domain/entities/image.dart';
import '../../../theme/app_theme.dart';
import '../../../widgets/primary_app_bar.dart';

class PhotoViewPage extends StatelessWidget {
  const PhotoViewPage({
    required this.title,
    this.image,
    this.images = const [],
  });
  final String title;
  final String? image;
  final List<Image> images;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrimaryAppBar(label: title),
      body: image != null
          ? PhotoView(
              imageProvider: CachedNetworkImageProvider(image!),
              backgroundDecoration: const BoxDecoration(
                color: Colors.transparent,
              ),
            )
          : PhotoViewGallery.builder(
              scrollPhysics: const BouncingScrollPhysics(),
              builder: (BuildContext context, int index) {
                return PhotoViewGalleryPageOptions(
                  imageProvider: CachedNetworkImageProvider(images[index].url),
                  initialScale: PhotoViewComputedScale.contained * 1.0,
                );
              },
              itemCount: images.length,
              backgroundDecoration: BoxDecoration(
                color: AppColors.white,
              ),
            ),
    );
  }
}
