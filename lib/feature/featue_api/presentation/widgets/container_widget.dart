import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/core/constants/login_constans.dart';
import 'package:movie_app/core/theme/app_theme.dart';
import 'package:movie_app/feature/featue_api/domain/entity/model_entity.dart';
import 'package:movie_app/feature/featue_api/presentation/pages/overview_page.dart';
import 'package:movie_app/feature/featue_api/presentation/provaider/movie_provaider.dart';

class ContainerWidget extends ConsumerWidget {
  List<MovieEntity> movieData;
  final int itemCount;
  ContainerWidget(
      {super.key, required this.movieData, required this.itemCount});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = AppTheme.of(context).colors;
    final space = AppTheme.of(context).spaces;
    final data = ref.watch(loginConstansProvider);
    final typography = AppTheme.of(context).typography;
    return SizedBox(
      height: space.space_500 * 5,
      child: ListView.builder(
        controller: ref.read(movieProvaiderProvider.notifier).scrollController,
        scrollDirection: Axis.horizontal,
        itemCount: itemCount,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.all(space.space_100),
            child: InkWell(
              onTap: () =>
                  context.push(OverViewPage.routePath, extra: movieData[index]),
              child: Container(
                height: space.space_500 * 5,
                width: space.space_500 * 3,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  image: DecorationImage(
                    image: NetworkImage(
                        data.imagePath + movieData[index].posterPath),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          );
        },
        shrinkWrap: false,
      ),
    );
  }
}
