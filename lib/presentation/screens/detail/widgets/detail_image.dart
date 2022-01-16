import 'package:flutter/material.dart';

import '../../../theme/app_theme.dart';
import '../../../widgets/app_image.dart';
import '../bloc/detail_bloc.dart';

class DetailImage extends StatelessWidget {
  const DetailImage(this.state, {Key? key}) : super(key: key);
  final DetailLoadSuccess state;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AppImage(
          state.product.productImages[0].url,
          borderRadius: BorderRadius.circular(0),
          placeholderHeight: 300,
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            height: 32,
            decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(32),
                )),
          ),
        )
      ],
    );
  }
}
