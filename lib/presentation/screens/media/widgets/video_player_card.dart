import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../../../../data/network/response_models/media.dart';
import '../../../widgets/app_image.dart';

class VideoPlayerCard extends StatefulWidget {
  const VideoPlayerCard({required this.media, Key? key}) : super(key: key);
  final Media media;

  @override
  State<VideoPlayerCard> createState() => VideoPlayerCardState();
}

class VideoPlayerCardState extends State<VideoPlayerCard> {
  late VideoPlayerController _videoPlayerController;

  @override
  void initState() {
    super.initState();
    _videoPlayerController =
        VideoPlayerController.networkUrl(Uri.parse(widget.media.video!))
          ..initialize().then((value) => setState(() {}));
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: _videoPlayerController.value.isInitialized
          ? ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Stack(
                children: [
                  VideoPlayer(_videoPlayerController),
                  Center(
                    child: Image.asset(
                      'assets/icons/media.png',
                      color: Colors.white,
                      width: 60,
                    ),
                  )
                ],
              ),
            )
          : const AppImagePlaceholder(height: 200),
    );
  }
}
