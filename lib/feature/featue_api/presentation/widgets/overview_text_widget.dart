import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/core/theme/app_theme.dart';

class OverViewTextWidget extends StatelessWidget {
  final String title;
  const OverViewTextWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final space = AppTheme.of(context).spaces;
    final typography = AppTheme.of(context).typography;
    return SizedBox(
      height: space.space_500 * 4,
      child: ListView(
        children: [
          Column(
            children: [
              Container(
                width: MediaQuery.sizeOf(context).width / 1.1,
                height: space.space_500 * 4,
                // color: Colors.blue,
                child: Text(
                  title,
                  style: typography.h500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
