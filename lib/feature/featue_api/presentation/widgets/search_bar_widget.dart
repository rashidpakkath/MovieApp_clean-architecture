import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/core/constants/login_constans.dart';
import 'package:movie_app/core/theme/app_theme.dart';
import 'package:movie_app/feature/featue_api/presentation/provaider/movie_provaider.dart';

class SearchBarWidget extends ConsumerWidget {
  const SearchBarWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = AppTheme.of(context).colors;
    final space = AppTheme.of(context).spaces;
    final data = ref.watch(loginConstansProvider);
    final SearchController =
        ref.read(movieProvaiderProvider.notifier).searchController;
    return Container(
      width: MediaQuery.sizeOf(context).width,
      height: space.space_500 * 1.7,
      color: colors.textSubtle,
      child: Padding(
        padding: EdgeInsets.all(space.space_50),
        child: TextField(
          controller: SearchController,
          decoration: InputDecoration(
            fillColor: colors.secondary,
            filled: true,
            labelText: data.search,
            labelStyle: TextStyle(color: colors.textInverse),
            prefixIcon: Icon(Icons.search),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: colors.textSubtle),
            ),
          ),
        ),
      ),
    );
  }
}
