import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/core/constants/login_constans.dart';
import 'package:movie_app/core/theme/app_theme.dart';
import 'package:movie_app/feature/featue_api/presentation/pages/favouritepage.dart';
import 'package:movie_app/feature/featue_api/presentation/pages/profilepage.dart';
import 'package:movie_app/feature/featue_api/presentation/provaider/movie_provaider.dart';
import 'package:movie_app/feature/featue_api/presentation/widgets/app_bar_widget.dart';
import 'package:movie_app/feature/featue_api/presentation/widgets/bottom_navigationbar_widget.dart';
import 'package:movie_app/feature/featue_api/presentation/widgets/carousel_slider_widget.dart';
import 'package:movie_app/feature/featue_api/presentation/widgets/container_widget.dart';
import 'package:movie_app/feature/featue_api/presentation/widgets/search_bar_widget.dart';
import 'package:movie_app/feature/featue_api/presentation/widgets/text_widget.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = AppTheme.of(context).colors;
    final space = AppTheme.of(context).spaces;
    final style = AppTheme.of(context).typography;
    final data = ref.watch(loginConstansProvider);
    return Scaffold(
      backgroundColor: colors.backgroundDanger,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBarWidget(
          title: data.homePage,
        ),
      ),
      body: ref.watch(movieProvaiderProvider).isRefreshing
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ref.watch(movieProvaiderProvider) == null
              ? const Text('NO DATA')
              : switch (ref.watch(movieProvaiderProvider)) {
                  AsyncData(:final value) => SingleChildScrollView(
                      child: Column(
                        children: [
                          // const SearchBarWidget(),
                          SizedBox(
                            height: space.space_100,
                          ),
                          TextWidget(
                            text: data.newRelease,
                          ),
                          CarouselSliderWidget(
                            movieData: value.getMoviesNewRelease!,
                            itemCount: value.getMoviesNewRelease!.length,
                          ),
                          TextWidget(
                            text: data.upcoming,
                          ),
                          ContainerWidget(
                            movieData: value.getMovieUpcoming!,
                            itemCount: value.getMovieUpcoming!.length,
                          ),
                          TextWidget(
                            text: data.mostWatch,
                          ),
                          ContainerWidget(
                            movieData: value.getMovieTopRated!,
                            itemCount: value.getMovieTopRated!.length,
                          ),
                          TextWidget(
                            text: data.popular,
                          ),
                          ContainerWidget(
                            movieData: value.getMoviePopular!,
                            itemCount: value.getMoviePopular!.length,
                          ),
                        ],
                      ),
                    ),
                  AsyncError(:final error, :final stackTrace) => Center(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: colors.secondary),
                        onPressed: () {
                          ref.invalidate(movieProvaiderProvider);
                        },
                        child: Text(
                          'Retry',
                          style: style.h500.copyWith(color: colors.textSubtle),
                        ),
                      ),
                    ),
                  _ => const Center(
                      child: CircularProgressIndicator(),
                    )
                },
    );
  }
}
