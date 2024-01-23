import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/core/constants/login_constans.dart';
import 'package:movie_app/core/theme/app_theme.dart';

class TopOfOverviewWidget extends ConsumerWidget {
  final String image;
  final String text;
  const TopOfOverviewWidget(
      {super.key, required this.image, required this.text});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final space = AppTheme.of(context).spaces;
    final data = ref.watch(loginConstansProvider);
    final typography = AppTheme.of(context).typography;
    final colors = AppTheme.of(context).colors;
    return Stack(
      children: [
        Container(
          height: space.space_500 * 13,
          width: MediaQuery.sizeOf(context).width,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(image),
              fit: BoxFit.fill,
            ),
          ),
        ),
        Positioned(
          top: space.space_300,
          left: space.space_200,
          child: IconButton(
            onPressed: () {
              context.pop();
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
              size: space.space_400,
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          child: Container(
            color: colors.secondary.withOpacity(.3),
            width: MediaQuery.sizeOf(context).width,
            height: space.space_500 * 1.5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  text,
                  textAlign: TextAlign.center,
                  style: typography.h900.copyWith(
                    fontSize: space.space_300,
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
