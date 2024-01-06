import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../../app/generated/l10n.dart';
import '../../../data/network/response_models/media.dart';
import '../../widgets/app_empty.dart';
import '../../widgets/app_error.dart';
import '../../widgets/app_loader.dart';
import 'bloc/media_list_bloc.dart';
import 'widgets/media_card.dart';
import 'widgets/media_categories.dart';

class MediaListScreen extends StatefulWidget {
  const MediaListScreen({Key? key}) : super(key: key);

  @override
  State<MediaListScreen> createState() => _MediaListScreenState();
}

class _MediaListScreenState extends State<MediaListScreen> {
  final _pagingController =
      PagingController<String?, Media>(firstPageKey: null);
  var _selected = 0;

  @override
  void initState() {
    super.initState();
    _pagingController.addPageRequestListener((next) {
      context
          .read<MediaListBloc>()
          .add(MediaListRequested(next: next, categoryId: null));
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
      body: BlocListener<MediaListBloc, MediaListState>(
        listener: (_, state) {
          if (state is MediaListLoadSuccess) {
            if (state.clear) _pagingController.itemList?.clear();
            if (state.next == null) {
              _pagingController.appendLastPage(state.media);
            } else {
              _pagingController.appendPage(state.media, state.next);
            }
          } else if (state is MediaListLoadError) {
            _pagingController.error = state.message;
          }
        },
        child: Column(
          children: [
            MediaCategories(
              selected: _selected,
              onSelected: (index, id) {
                context.read<MediaListBloc>().add(MediaListRequested(
                      categoryId: id == -1 ? null : id,
                      next: null,
                      clear: true,
                    ));
                setState(() => _selected = index);
              },
            ),
            Expanded(
              child: PagedListView.separated(
                physics: const BouncingScrollPhysics(),
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
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
                      padding: EdgeInsets.fromLTRB(0, 30, 0, 50),
                      child: AppLoader()),
                  noItemsFoundIndicatorBuilder: (_) =>
                      AppEmpty(message: S.current.empty),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
