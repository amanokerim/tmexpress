import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/product_mini.dart';
import '../../theme/app_theme.dart';
import '../../widgets/app_error.dart';
import '../../widgets/app_image.dart';
import '../../widgets/app_progress_indicator.dart';
import 'bloc/detail_bloc.dart';
import 'widgets/detail_image.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen(this.product, {Key? key}) : super(key: key);
  final ProductMini product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<DetailBloc, DetailState>(builder: (_, state) {
        if (state is DetailLoadSuccess) {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DetailImage(state),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(state.product.title,
                      style: AppTextStyle.bold20,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis),
                ),
                if (state.product.productImages.length > 1) ...[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 20, 20, 8),
                    child: Text('Reňkler:', style: AppTextStyle.bold16),
                  ),
                  SizedBox(
                    height: 64,
                    child: ListView.separated(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      itemCount: state.product.productImages.length,
                      itemBuilder: (_, index) => AppImage(
                          state.product.productImages[index].urlMini,
                          width: 64),
                      separatorBuilder: (_, __) => const SizedBox(width: 12),
                      scrollDirection: Axis.horizontal,
                    ),
                  ),
                ],
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 24, 20, 16),
                  child: Text('Ölçegler:', style: AppTextStyle.bold16),
                ),
                SizedBox(
                  height: 44,
                  child: ListView.separated(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    itemCount: state.product.size.length,
                    itemBuilder: (_, index) => Container(
                      padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: AppColors.lGrey, width: .5),
                      ),
                      child: Text(state.product.size[index].title,
                          style: AppTextStyle.bold16),
                    ),
                    separatorBuilder: (_, __) => const SizedBox(width: 12),
                    scrollDirection: Axis.horizontal,
                  ),
                ),
              ],
            ),
          );
        } else if (state is DetailLoadError) {
          return AppError(
            message: state.message,
            onPressed: () =>
                context.read<DetailBloc>().add(DetailRequested(product.id)),
          );
        }
        return const AppProgressIndicator();
      }),
    );
  }
}
