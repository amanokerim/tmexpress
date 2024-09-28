import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class AppImage extends StatelessWidget {
  const AppImage(
    this.url, {
    this.height,
    this.width,
    this.color,
    this.borderRadius,
    Key? key,
    this.placeholderHeight,
  }) : super(key: key);
  final String url;
  final double? height;
  final double? placeholderHeight;
  final double? width;
  final Color? color;
  final BorderRadius? borderRadius;

  @override
  Widget build(BuildContext context) {
    if (url.endsWith('null')) {
      AppImagePlaceholder(height: placeholderHeight ?? height);
    }
    return ClipRRect(
      borderRadius: borderRadius ?? BorderRadius.circular(16),
      child: CachedNetworkImage(
        fadeInDuration: const Duration(milliseconds: 0),
        fit: BoxFit.cover,
        height: height,
        width: width,
        color: color,
        imageUrl: url,
        errorWidget: (_, __, ___) {
          return AppImagePlaceholder(height: placeholderHeight ?? height);
        },
        placeholder: (_, __) =>
            AppImagePlaceholder(height: placeholderHeight ?? height),
      ),
    );
  }
}

class AppImagePlaceholder extends StatelessWidget {
  const AppImagePlaceholder({
    this.height,
    this.borderRadius,
    super.key,
  });
  final double? height;
  final BorderRadius? borderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.lGrey,
        borderRadius: borderRadius ?? BorderRadius.circular(16),
      ),
      height: height,
      width: double.infinity,
      child: Image.asset('assets/logo-tr.png'),
    );
  }
}
