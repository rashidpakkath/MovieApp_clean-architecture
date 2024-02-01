import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/core/constants/login_constans.dart';
import 'package:movie_app/core/theme/app_theme.dart';
import 'package:movie_app/feature/featue_api/domain/entity/comment_entity.dart';
import 'package:movie_app/feature/featue_api/domain/entity/model_entity.dart';
import 'package:movie_app/feature/featue_api/presentation/provaider/movie_provaider.dart';
import 'package:movie_app/feature/featue_api/presentation/widgets/buttons_widget.dart';
import 'package:movie_app/feature/feature_create/presentation/widgets/textfield_widget.dart';

class PlayButtonWidget extends ConsumerWidget {
  final MovieEntity entity;
  const PlayButtonWidget({super.key, required this.entity});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = AppTheme.of(context).colors;
    final space = AppTheme.of(context).spaces;
    final data = ref.watch(loginConstansProvider);
    final typography = AppTheme.of(context).typography;
    final commentTextController =
        ref.read(movieProvaiderProvider.notifier).commentTextController;
    return Container(
      width: MediaQuery.sizeOf(context).width / 1.05,
      height: space.space_500 * 2,
      color: Colors.black,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ButtonsWidget(
            color: colors.textSubtlest,
            text: data.like,
            icons: Icon(Icons.thumb_up),
            onPressed: () {},
          ),
          ButtonsWidget(
            color: colors.textSubtlest,
            text: data.comment,
            icons: Icon(Icons.message),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text('Add Review'),
                    content: TextFieldWidget(
                      labelText: data.enterPleace,
                      iconData: Icon(Icons.comment),
                      controller: commentTextController,
                    ),
                    actions: [
                      IconButton(
                        onPressed: () {
                          ref
                              .read(movieProvaiderProvider.notifier)
                              .addCommentCollection(
                                CommentEntity(
                                    text: commentTextController.text,
                                    id: entity.id.toString(),
                                    movieid: ""),
                                entity.id.toString(),
                              );

                          commentTextController.clear();
                          context.pop();
                        },
                        icon: Icon(Icons.send),
                      ),
                    ],
                  );
                },
              );
            },
          ),
          ButtonsWidget(
            color: colors.textSubtlest,
            text: data.favourite,
            icons: Icon(Icons.favorite),
            onPressed: () {
              ref
                  .read(movieProvaiderProvider.notifier)
                  .createFireStoreCollection(entity);
            },
          ),
        ],
      ),
    );
  }
}
