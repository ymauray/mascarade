import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mascarade/provider/fiche_provider.dart';
import 'package:mascarade/utils/lyout_type.dart';
import 'package:mascarade/widget/entry.dart';

class Identity extends ConsumerWidget {
  const Identity({this.layout = LayoutType.wide, super.key});

  final LayoutType layout;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final fiche = ref.watch(ficheProvider);

    final bloc1 = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Entry(
          leading: 'Nom :',
          value: fiche.nom,
          layout: layout,
        ),
        Entry(
          leading: 'Joueur :',
          value: fiche.joueur,
          layout: layout,
        ),
        Entry(
          leading: 'Chronique :',
          value: fiche.chronique,
          layout: layout,
        ),
      ],
    );

    final bloc2 = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Entry(
          leading: 'Nature :',
          value: fiche.nature,
          layout: layout,
        ),
        Entry(
          leading: 'Attitude :',
          value: fiche.attitude,
          layout: layout,
        ),
        Entry(
          leading: 'Concept :',
          value: fiche.concept,
          layout: layout,
        ),
      ],
    );

    final bloc3 = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Entry(
          leading: 'Clan :',
          value: fiche.clan,
          layout: layout,
        ),
        Entry(
          leading: 'Génération :',
          value: fiche.generation,
          layout: layout,
        ),
        Entry(
          leading: 'Refuge :',
          value: fiche.refuge,
          layout: layout,
        ),
      ],
    );

    return layout == LayoutType.wide
        ? Row(
            children: [
              Expanded(
                child: bloc1,
              ),
              Expanded(
                child: bloc2,
              ),
              Expanded(
                child: bloc3,
              ),
            ],
          )
        : Column(
            children: [bloc1, bloc2, bloc3],
          );
  }
}
