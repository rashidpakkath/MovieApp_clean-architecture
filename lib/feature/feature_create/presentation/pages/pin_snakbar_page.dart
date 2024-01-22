import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SnakbarWidget extends ConsumerWidget {
  static const routePath = '/pincode';
  const SnakbarWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: SnakbarWidget(),
      ),
    );
  }
}
