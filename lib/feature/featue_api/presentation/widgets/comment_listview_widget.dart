import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/core/constants/login_constans.dart';
import 'package:movie_app/core/theme/app_theme.dart';
import 'package:movie_app/feature/featue_api/domain/entity/comment_entity.dart';

class CommentListViewWidget extends ConsumerWidget {
  final List<CommentEntity> entitycomment;
  const CommentListViewWidget({super.key, required this.entitycomment});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = AppTheme.of(context).colors;
    final space = AppTheme.of(context).spaces;
    final style = AppTheme.of(context).typography;
    final data = ref.watch(loginConstansProvider);
    return SizedBox(
      width: MediaQuery.sizeOf(context).width,
      height: entitycomment.length * space.space_900,
      child: ListView.builder(
        itemCount: entitycomment.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Container(
                width: MediaQuery.sizeOf(context).width / 1.1,
                height: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(space.space_100),
                ),
                child: Padding(
                  padding: EdgeInsets.all(space.space_100),
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: colors.secondary,
                        backgroundImage: AssetImage(data.profileImage),
                      ),
                      SizedBox(
                        width: space.space_300,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            entitycomment[index].text,
                            style: style.h500.copyWith(color: colors.secondary),
                          ),
                          SizedBox(
                            height: space.space_200,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.thumb_up,
                                color: colors.secondary,
                              ),
                              SizedBox(
                                width: space.space_300,
                              ),
                              Icon(
                                Icons.thumb_down,
                                color: colors.secondary,
                              )
                            ],
                          )
                        ],
                      ),
                      // IconButton(
                      //   onPressed: (){},
                      //   icon: Icon(
                      //     Icons.delete,
                      //     color: colors.secondary,
                      //   ),
                      // )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: space.space_300,
                  right: space.space_300,
                ),
                child: Divider(
                  color: colors.secondary,
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
