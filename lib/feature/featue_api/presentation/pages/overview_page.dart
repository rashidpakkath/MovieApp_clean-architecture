import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/core/constants/login_constans.dart';
import 'package:movie_app/core/theme/app_theme.dart';
import 'package:movie_app/feature/featue_api/domain/entity/model_entity.dart';
import 'package:movie_app/feature/featue_api/presentation/provaider/movie_provaider.dart';
import 'package:movie_app/feature/featue_api/presentation/provaider/video_provider.dart';
import 'package:movie_app/feature/featue_api/presentation/widgets/comment_listview_widget.dart';
import 'package:movie_app/feature/featue_api/presentation/widgets/moviedetails_widget.dart';
import 'package:movie_app/feature/featue_api/presentation/widgets/overview_text_widget.dart';
import 'package:movie_app/feature/featue_api/presentation/widgets/overview_top_widget.dart';
import 'package:movie_app/feature/featue_api/presentation/widgets/play_button_widget.dart';
import 'package:movie_app/feature/featue_api/presentation/widgets/play_trailer_widget.dart';
import 'package:movie_app/feature/featue_api/presentation/widgets/text_widget.dart';
import 'package:movie_app/feature/featue_api/presentation/widgets/title_widget.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

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
              PlayButtonWidget(entity: entity),
              MovieDetailWidget(
                year: entity.releaseDate,
                rating: entity.voteAverage.round().toString(),
                language: entity.originalLanguage,
              ),
              OverViewTextWidget(title: entity.overview),
              ref.watch(trailerProvider(entity.id.toString())).isRefreshing
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : Center(
                      child: SizedBox(
                        height: MediaQuery.sizeOf(context).height * .24,
                        child: Center(
                          child: switch (ref
                              .watch(trailerProvider(entity.id.toString()))) {
                            AsyncData(:final value) => PageView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: value!.length,
                                itemBuilder: (context, index) {
                                  return YoutubePlayer(
                                    controller: YoutubePlayerController(
                                      initialVideoId: value[index].key!,
                                      flags: const YoutubePlayerFlags(
                                        autoPlay: false,
                                        mute: false,
                                        disableDragSeek: true,
                                      ),
                                    ),
                                    bufferIndicator: const Center(
                                        child: CircularProgressIndicator()),
                                    showVideoProgressIndicator: true,
                                  );
                                },
                              ),
                            AsyncError(:final error) => Column(
                                children: [
                                  Text("$error"),
                                  TextButton(
                                    onPressed: () {
                                      ref.invalidate(trailerProvider(
                                          entity.id.toString()));
                                    },
                                    child: const Text('Retry'),
                                  )
                                ],
                              ),
                            _ => const CircularProgressIndicator()
                          },
                        ),
                      ),
                    ),
              TextWidget(text: data.comment),
              StreamBuilder(
                  stream: ref
                      .read(movieProvaiderProvider.notifier)
                      .getCommentCollection(
                        entity.id.toString(),
                      ),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return CommentListViewWidget(
                        entitycomment: snapshot.data!,
                      );
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  }),
            ],
          ),
        ));
  }
}
