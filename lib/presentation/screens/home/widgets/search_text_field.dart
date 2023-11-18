import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/generated/l10n.dart';
import '../../../theme/app_theme.dart';
import '../search/bloc/search_bloc.dart';
import '../search/search_page.dart';

class SearchTextField extends StatefulWidget {
  const SearchTextField(this.query, {Key? key}) : super(key: key);

  /// If query is null, it means this widget is created from home screen.
  /// From search screen initial query will be passed.
  final String? query;

  @override
  State<SearchTextField> createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.query ?? '');
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      decoration: InputDecoration(
        hintText: S.current.searchHint,
        fillColor: Colors.transparent,
        suffixIcon: IconButton(
          onPressed: _onPressed,
          icon: Image.asset(
            'assets/icons/search.png',
            width: 20,
            color: AppColors.grey,
          ),
        ),
      ),
      onEditingComplete: _onPressed,
      textInputAction: TextInputAction.search,
    );
  }

  VoidCallback get _onPressed =>
      // If created from home screen, nav to search screen, else make request
      widget.query == null ? _navigateToSearchScreen : _requestSearch;

  void _navigateToSearchScreen() {
    Navigator.of(context)
        .push(MaterialPageRoute<void>(
            builder: (_) => SearchPage(_controller.text)))
        .then((_) {
      FocusScope.of(context).unfocus();
      _controller.text = '';
    });
  }

  void _requestSearch() => context
      .read<SearchBloc>()
      .add(SearchRequested(_controller.text, null, clear: true));
}
