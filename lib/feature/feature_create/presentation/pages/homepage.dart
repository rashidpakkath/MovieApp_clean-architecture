import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/feature/feature_create/presentation/provider/auth_provaider.dart';

class HomePage extends ConsumerWidget {
  static const routePath = '/';
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.amber,
      appBar: AppBar(
        title: Text('Home Page'),
        actions: [
          ElevatedButton(
            onPressed: () {
              ref.read(authenticationProvider(context).notifier).logout();
            },
            child: Text('Logout'),
          ),
        ],
      ),
    );
  }
}
