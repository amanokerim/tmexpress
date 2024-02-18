import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart' hide Image;
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import '../../../../domain/entities/image.dart';
import '../../../theme/app_theme.dart';
import '../../../widgets/app_cart_button.dart';
import '../../../widgets/primary_app_bar.dart';

class PhotoViewPage extends StatefulWidget {
  const PhotoViewPage({
    required this.title,
    this.image,
    this.images = const [],
    this.initialIndex = 0,
  });

  final String title;
  final String? image;
  final List<Image> images;
  final int initialIndex;

  @override
  State<PhotoViewPage> createState() => _PhotoViewPageState();
}

class _PhotoViewPageState extends State<PhotoViewPage> {
  late PageController controller;

  @override
  void initState() {
    super.initState();
    controller = PageController(initialPage: widget.initialIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrimaryAppBar(
        label: widget.title,
        action: const Padding(
          padding: EdgeInsets.only(right: 15),
          child: AppCartButton(size: 28),
        ),
      ),
      body: widget.image != null
          ? PhotoView(
              imageProvider: CachedNetworkImageProvider(widget.image!),
              backgroundDecoration: const BoxDecoration(
                color: Colors.transparent,
              ),
            )
          : PhotoViewGallery.builder(
              pageController: controller,
              scrollPhysics: const BouncingScrollPhysics(),
              builder: (BuildContext context, int index) {
                return PhotoViewGalleryPageOptions(
                  imageProvider:
                      CachedNetworkImageProvider(widget.images[index].url),
                  initialScale: PhotoViewComputedScale.contained * 1.0,
                );
              },
              itemCount: widget.images.length,
              backgroundDecoration: BoxDecoration(
                color: AppColors.white,
              ),
            ),
    );
  }
}
