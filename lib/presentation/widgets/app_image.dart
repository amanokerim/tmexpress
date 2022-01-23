import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class AppImage extends StatelessWidget {
  const AppImage(this.url,
      {this.height,
      this.width,
      this.color,
      this.borderRadius,
      Key? key,
      this.placeholderHeight})
      : super(key: key);
  final String url;
  final double? height;
  final double? placeholderHeight;
  final double? width;
  final Color? color;
  final BorderRadius? borderRadius;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius ?? BorderRadius.circular(16),
      child: CachedNetworkImage(
        fadeInDuration: const Duration(milliseconds: 0),
        fit: BoxFit.cover,
        height: height,
        width: width,
        color: color,
        imageUrl: url,
        errorWidget: (_, __, ___) => noImage(),
        placeholder: (_, __) => noImage(),
      ),
    );
  }

  Container noImage() => Container(
        height: placeholderHeight,
        width: double.infinity,
        color: AppColors.bg2,
        child: Icon(
          Icons.photo,
          color: AppColors.lGrey,
          size: placeholderHeight != null ? placeholderHeight! / 3 : 30,
        ),
      );
}
