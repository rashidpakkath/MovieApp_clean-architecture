import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CardWidget extends ConsumerWidget {
  final Icon icon;
  final String name;
  const CardWidget({super.key, required this.icon, required this.name});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8),
      child: Card(
        child: ListTile(
          leading: icon,
          title: Text(name),
          trailing: Icon(
            Icons.chevron_right,
          ),
        ),
      ),
    );
  }
}
