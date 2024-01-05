import 'package:flutter/material.dart';

import '../../../../data/network/response_models/media.dart';
import '../../../theme/app_theme.dart';
import '../../../widgets/app_image.dart';
import '../media_detail/media_screen.dart';
import 'video_player_card.dart';

class MediaCard extends StatelessWidget {
  const MediaCard(this.media, {Key? key}) : super(key: key);
  final Media media;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(
          MaterialPageRoute<void>(builder: (_) => MediaScreen(media: media))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if ((media.video ?? '').isNotEmpty)
            VideoPlayerCard(media: media)
          else if ((media.image ?? '').isNotEmpty)
            AppImage(media.image!),
          if ((media.title ?? '').isNotEmpty) ...[
            const SizedBox(height: 8),
            Text(
              media.title!,
              style: AppTextStyle.bold20,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ]
        ],
      ),
    );
  }
}
