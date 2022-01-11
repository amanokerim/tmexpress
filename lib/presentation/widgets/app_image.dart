import 'dart:typed_data';

import 'package:blurhash_dart/blurhash_dart.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image/image.dart' as img_pcg;

import '../../domain/entities/interface/image.dart' as img_ent;
import '../theme/app_theme.dart';

/// Widget for showing image with caching, blurhash and error image
class AppImage extends StatefulWidget {
  const AppImage({
    required this.image,
    required this.borderRadius,
    required this.size,
    Key? key,
  }) : super(key: key);

  final img_ent.Image? image;
  final BorderRadius? borderRadius;
  final Size size;

  @override
  State<AppImage> createState() => _AppImageState();
}

class _AppImageState extends State<AppImage>
    with AutomaticKeepAliveClientMixin {
  late Uint8List bytes;

  @override
  void initState() {
    super.initState();
    if (widget.image != null && widget.image!.blurHash.isNotEmpty) {
      final blurHash = BlurHash.decode(widget.image!.blurHash);
      final _image = blurHash.toImage(35, 20);
      bytes = Uint8List.fromList(img_pcg.encodeJpg(_image));
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ClipRRect(
      borderRadius: widget.borderRadius,
      child: (widget.image?.file ?? '').isEmpty
          ? noImage()
          : CachedNetworkImage(
              fadeInDuration: const Duration(milliseconds: 0),
              width: widget.size.width,
              height: widget.size.height == -1 ? null : widget.size.height,
              fit: BoxFit.cover,
              imageUrl: widget.image?.file ?? '',
              errorWidget: (_, __, ___) => noImage(),
              placeholder: (_, __) => Image.memory(
                bytes,
                fit: BoxFit.cover,
              ),
            ),
    );
  }

  // TODO Style it
  Container noImage() {
    return Container(
      height: widget.size.height,
      width: widget.size.width,
      color: AppColors.grey,
      padding: EdgeInsets.all(widget.size.height * .3),
      child: SvgPicture.asset('assets/icons/union.svg'),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
