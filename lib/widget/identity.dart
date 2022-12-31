import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mascarade/widget/entry.dart';

class Identity extends ConsumerWidget {
  const Identity({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Entry(leading: 'Nom :'),
              Entry(leading: 'Joueur :'),
              Entry(leading: 'Chronique :'),
            ],
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Entry(leading: 'Nature :'),
              Entry(leading: 'Attitude :'),
              Entry(leading: 'Concept :'),
            ],
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Entry(leading: 'Clan :'),
              Entry(leading: 'Génération :'),
              Entry(leading: 'Refuge :'),
            ],
          ),
        ),
      ],
    );
  }
}
