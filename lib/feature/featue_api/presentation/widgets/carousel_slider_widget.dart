import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/core/constants/login_constans.dart';
import 'package:movie_app/core/theme/app_theme.dart';
import 'package:movie_app/feature/featue_api/domain/entity/model_entity.dart';
import 'package:movie_app/feature/featue_api/presentation/widgets/container_widget.dart';

class CarouselSliderWidget extends ConsumerWidget {
  final int itemCount;
  List<MovieEntity> movieData;
  CarouselSliderWidget(
      {super.key, required this.movieData, required this.itemCount});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = AppTheme.of(context).colors;
    final space = AppTheme.of(context).spaces;
    final data = ref.watch(loginConstansProvider);
    final typography = AppTheme.of(context).typography;
    return CarouselSlider.builder(
      itemCount: itemCount,
      itemBuilder: (context, index, realIndex) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            image: DecorationImage(
              image: NetworkImage(data.imagePath + movieData[index].posterPath),
              fit: BoxFit.fill,
            ),
          ),
        );
      },
      options: CarouselOptions(
        height: space.space_500 * 5,
        enlargeCenterPage: true,
        autoPlay: true,
        aspectRatio: 16 / 9,
        autoPlayCurve: Curves.fastOutSlowIn,
        enableInfiniteScroll: true,
        autoPlayAnimationDuration: Duration(milliseconds: 800),
        viewportFraction: 0.8,
      ),
    );
  }
}
