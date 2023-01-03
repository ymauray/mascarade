import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mascarade/provider/fiche_provider.dart';
import 'package:mascarade/widget/entry.dart';

class Identity extends ConsumerWidget {
  const Identity({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final fiche = ref.watch(ficheProvider);

    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Entry(
                leading: 'Nom :',
                value: fiche.nom,
              ),
              Entry(leading: 'Joueur :', value: fiche.joueur),
              Entry(
                leading: 'Chronique :',
                value: fiche.chronique,
              ),
            ],
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Entry(
                leading: 'Nature :',
                value: fiche.nature,
              ),
              Entry(
                leading: 'Attitude :',
                value: fiche.attitude,
              ),
              Entry(
                leading: 'Concept :',
                value: fiche.concept,
              ),
            ],
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Entry(leading: 'Clan :', value: fiche.clan),
              Entry(leading: 'Génération :', value: fiche.generation),
              Entry(leading: 'Refuge :', value: fiche.refuge),
            ],
          ),
        ),
      ],
    );
  }
}
