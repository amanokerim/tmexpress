import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/entities/size.dart';
import '../../../theme/app_theme.dart';
import '../bloc/detail_bloc.dart';

class SizeCard extends StatelessWidget {
  const SizeCard(this.size, {this.selected = false, Key? key})
      : super(key: key);
  final Size size;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: () => context.read<DetailBloc>().add(DetailSizeChanged(size)),
      child: Container(
        margin: const EdgeInsets.all(6),
        padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
              color: selected ? AppColors.dark : AppColors.lGrey, width: .5),
        ),
        child: Text(size.title, style: AppTextStyle.bold14),
      ),
    );
  }
}
