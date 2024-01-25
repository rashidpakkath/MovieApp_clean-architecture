import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/core/constants/login_constans.dart';
import 'package:movie_app/core/theme/app_theme.dart';
import 'package:movie_app/feature/featue_api/domain/entity/model_entity.dart';
import 'package:movie_app/feature/featue_api/presentation/widgets/moviedetails_widget.dart';
import 'package:movie_app/feature/featue_api/presentation/widgets/overview_text_widget.dart';
import 'package:movie_app/feature/featue_api/presentation/widgets/overview_top_widget.dart';
import 'package:movie_app/feature/featue_api/presentation/widgets/play_button_widget.dart';
import 'package:movie_app/feature/featue_api/presentation/widgets/play_trailer_widget.dart';
import 'package:movie_app/feature/featue_api/presentation/widgets/title_widget.dart';

class OverViewPage extends ConsumerWidget {
  static const routePath = '/overview';
  final MovieEntity entity;
  const OverViewPage({super.key, required this.entity});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = AppTheme.of(context).colors;
    final space = AppTheme.of(context).spaces;
    final data = ref.watch(loginConstansProvider);
    return Scaffold(
        backgroundColor: colors.textSubtle,
        body: SingleChildScrollView(
          child: Column(
            children: [
              TopOfOverviewWidget(
                image: data.imagePath + entity.posterPath,
              ),
              SizedBox(
                height: space.space_100,
              ),
              TitleWidget(text: entity.title),
              const PlayButtonWidget(),
              MovieDetailWidget(
                year: entity.releaseDate,
                rating: entity.voteAverage.round().toString(),
                language: entity.originalLanguage,
              ),
              OverViewTextWidget(title: entity.overview),
              const PlayTrailerWidget(),
            ],
          ),
        ));
  }
}
