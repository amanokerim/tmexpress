import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../../../../data/network/response_models/media.dart';
import '../../../../domain/entities/product/tag.dart';
import '../../../theme/app_theme.dart';
import '../../../widgets/app_banner_b.dart';
import '../../../widgets/app_cart_button.dart';
import '../../../widgets/app_image.dart';
import '../../../widgets/primary_app_bar.dart';
import '../../home/widgets/tag.w.dart';

class MediaScreen extends StatefulWidget {
  const MediaScreen({required this.media, Key? key}) : super(key: key);
  final Media media;

  @override
  State<MediaScreen> createState() => MediaScreenState();
}

class MediaScreenState extends State<MediaScreen> {
  late VideoPlayerController _videoPlayerController;
  late ChewieController _chewieController;

  @override
  void initState() {
    super.initState();
    if (widget.media.video != null) {
      _videoPlayerController =
          VideoPlayerController.networkUrl(Uri.parse(widget.media.video!))
            ..initialize().then((value) => setState(() {}));
      _chewieController = ChewieController(
        allowedScreenSleep: false,
        allowFullScreen: false,
        aspectRatio: 1,
        videoPlayerController: _videoPlayerController,
        autoInitialize: true,
        autoPlay: true,
        showControls: true,
        fullScreenByDefault: false,
        allowMuting: true,
        looping: true,
      );
    }
  }

  @override
  void dispose() {
    if (widget.media.video != null) {
      _videoPlayerController.dispose();
      _chewieController.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrimaryAppBar(
        label: widget.media.title ?? '',
        action: const Padding(
          padding: EdgeInsets.only(right: 15),
          child: AppCartButton(size: 28),
        ),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            if (widget.media.video != null)
              AspectRatio(
                aspectRatio: 1,
                child: _videoPlayerController.value.isInitialized
                    ? Chewie(controller: _chewieController)
                    : AppImagePlaceholder(
                        borderRadius: BorderRadius.circular(0),
                      ),
              )
            else if ((widget.media.image ?? '').isNotEmpty)
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                child: AppImage(widget.media.image!),
              ),
            if ((widget.media.title ?? '').isNotEmpty) ...[
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 24, 16, 0),
                child: Text(widget.media.title!, style: AppTextStyle.black20),
              ),
            ],
            if ((widget.media.description ?? '').isNotEmpty) ...[
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                child: Text(
                  widget.media.description!,
                  style: AppTextStyle.dark16,
                ),
              ),
            ],
            const SizedBox(height: 16),
            const AppBannerB(),
            if (widget.media.products.isNotEmpty) ...[
              const SizedBox(height: 20),
              TagWidget(
                Tag(id: 0, title: '', products: widget.media.products),
              ),
            ],
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
