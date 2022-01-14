import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../theme/app_theme.dart';

class NoNetwork extends StatelessWidget {
  const NoNetwork(this.message, this.onReload);

  final String message;
  final VoidCallback onReload;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            'assets/svg/no-wifi.svg',
            width: 50,
          ),
          Text('no_connection', style: AppTextStyle.dark16),
          const SizedBox(height: 20),
          TextButton(
            onPressed: onReload,
            child: Text('retry', style: AppTextStyle.bold14),
          )
        ],
      ),
    );
  }
}
