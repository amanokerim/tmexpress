import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../../app/generated/l10n.dart';
import '../../../data/network/response_models/media.dart';
import '../../widgets/app_empty.dart';
import '../../widgets/app_error.dart';
import '../../widgets/app_loader.dart';
import 'bloc/media_bloc.dart';
import 'widgets/media_card.dart';

class MediaScreen extends StatefulWidget {
  const MediaScreen({Key? key}) : super(key: key);

  @override
  State<MediaScreen> createState() => _MediaScreenState();
}

class _MediaScreenState extends State<MediaScreen> {
  final _pagingController =
      PagingController<String?, Media>(firstPageKey: null);

  @override
  void initState() {
    super.initState();
    _pagingController.addPageRequestListener((next) {
      context
          .read<MediaBloc>()
          .add(MediaRequested(next: next, categoryId: null));
    });
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<MediaBloc, MediaState>(
        listener: (_, state) {
          if (state is MediaLoadSuccess) {
            if (state.next == null) {
              _pagingController.appendLastPage(state.media);
            } else {
              _pagingController.appendPage(state.media, state.next);
            }
          } else if (state is MediaLoadError) {
            _pagingController.error = state.message;
          }
        },
        child: PagedListView.separated(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          pagingController: _pagingController,
          separatorBuilder: (_, __) => const SizedBox(height: 16),
          builderDelegate: PagedChildBuilderDelegate<Media>(
            itemBuilder: (context, media, index) => MediaCard(media),
            firstPageErrorIndicatorBuilder: (_) => AppErrorScreen(
              message: _pagingController.error,
              onPressed: _pagingController.retryLastFailedRequest,
            ),
            newPageErrorIndicatorBuilder: (_) => Padding(
              padding: const EdgeInsets.fromLTRB(0, 30, 0, 50),
              child: AppErrorScreen(
                message: _pagingController.error,
                onPressed: _pagingController.retryLastFailedRequest,
              ),
            ),
            firstPageProgressIndicatorBuilder: (_) => const AppLoader(),
            newPageProgressIndicatorBuilder: (_) => const Padding(
                padding: EdgeInsets.fromLTRB(0, 30, 0, 50), child: AppLoader()),
            noItemsFoundIndicatorBuilder: (_) =>
                AppEmpty(message: S.current.cartEmpty),
          ),
        ),
      ),
    );
  }
}
