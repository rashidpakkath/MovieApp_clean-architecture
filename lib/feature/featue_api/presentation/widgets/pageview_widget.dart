import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/feature/featue_api/presentation/pages/favouritepage.dart';
import 'package:movie_app/feature/featue_api/presentation/pages/homepage.dart';
import 'package:movie_app/feature/featue_api/presentation/pages/profilepage.dart';
import 'package:movie_app/feature/featue_api/presentation/provaider/movie_provaider.dart';
import 'package:movie_app/feature/featue_api/presentation/widgets/bottom_navigationbar_widget.dart';

class PageViewWidget extends ConsumerWidget {
  static const routePath = '/';
  const PageViewWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: PageView(
        controller: ref.read(movieProvaiderProvider.notifier).pageController,
        onPageChanged: (value) {
          ref.read(selected.notifier).state = value;
        },
        children: [
          HomePage(),
          FavouritePage(),
          ProfilePage(),
        ],
      ),
      bottomNavigationBar: const BottomNavigationbarWidget(),
    );
  }
}
