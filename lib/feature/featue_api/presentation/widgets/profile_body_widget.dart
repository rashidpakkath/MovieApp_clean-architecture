import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/core/constants/login_constans.dart';
import 'package:movie_app/feature/featue_api/presentation/widgets/card_widget.dart';

class ProfileBodyWidget extends ConsumerWidget {
  const ProfileBodyWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(loginConstansProvider);
    return Column(
      children: [
        CardWidget(
          icon: Icon(Icons.person),
          name: data.name,
        ),
        CardWidget(
          icon: Icon(Icons.key),
          name: data.account,
        ),
        CardWidget(
          icon: Icon(Icons.lock),
          name: data.privacy,
        ),
        CardWidget(
          icon: Icon(Icons.settings),
          name: data.settings,
        ),
        CardWidget(
          icon: Icon(Icons.notifications),
          name: data.notification,
        ),
        CardWidget(
          icon: Icon(Icons.help),
          name: data.help,
        ),
        CardWidget(
          icon: Icon(Icons.logout),
          name: data.logOut,
        ),
      ],
    );
  }
}
