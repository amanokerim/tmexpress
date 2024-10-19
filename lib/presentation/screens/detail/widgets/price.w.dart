import 'package:flutter/material.dart';

import '../../../theme/app_theme.dart';

class PriceW extends StatelessWidget {
  const PriceW(this.label, this.price, {super.key});
  final String label;
  final double price;

  @override
  Widget build(BuildContext context) => pure;

  Widget get pure => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('$label:', style: AppTextStyle.priceTitle),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(price.floor().toString(), style: AppTextStyle.black20),
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Text(
                  '${(price - price.truncate()).toStringAsFixed(2)} man.'
                      .substring(1),
                  style: AppTextStyle.dark12,
                ),
              ),
            ],
          ),
        ],
      );

  Widget get exp => Expanded(child: pure);
}
