import 'package:flutter/material.dart';

import '../../../theme/app_theme.dart';

class PriceW extends StatelessWidget {
  const PriceW(this.label, this.price, {Key? key}) : super(key: key);
  final String label;
  final double price;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('$label:', style: AppTextStyle.priceTitle),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(price.toStringAsFixed(0), style: AppTextStyle.black20),
              Padding(
                padding: const EdgeInsets.only(bottom: 5),
                child: Text(
                  '${(price - price.truncate()).toStringAsFixed(2)} man.'
                      .substring(1),
                  style: AppTextStyle.dark14,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
