import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../theme/app_theme.dart';

class Emtpy extends StatelessWidget {
  const Emtpy(this.title);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset('assets/svg/empty.svg', width: 100),
          const SizedBox(height: 20),
          Text(
            title,
            style: AppTextStyle.bold16,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
