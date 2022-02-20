import 'package:flutter/material.dart' hide Image;
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/entities/image.dart';
import '../../../theme/app_theme.dart';
import '../../../widgets/app_image.dart';
import '../bloc/detail_bloc.dart';

class ColorCard extends StatelessWidget {
  const ColorCard(this.image, {required this.isSelected, Key? key})
      : super(key: key);
  final Image image;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(6),
          child: AppImage(image.urlMini, width: 64, height: 64),
        ),
        Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(16),
            onTap: () =>
                context.read<DetailBloc>().add(DetailColorChanged(image)),
            child: Container(
              width: 64,
              height: 64,
              margin: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: isSelected
                    ? Border.all(width: .5, color: AppColors.dark)
                    : null,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
