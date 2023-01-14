import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mascarade/model/attribute.dart';
import 'package:mascarade/model/avantage.dart';
import 'package:mascarade/provider/fiche_provider.dart';
import 'package:mascarade/utils/layout_type.dart';
import 'package:mascarade/widget/attributes_column.dart';

class AdvantagesSection extends ConsumerWidget {
  const AdvantagesSection({
    this.layout = LayoutType.wide,
    super.key,
  });

  final LayoutType layout;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final fiche = ref.watch(ficheProvider);
    final historiques = (fiche.avantages ?? [])
        .where((a) => a.type == 'historique')
        .toList()
      ..sort((a, b) => a.libelle.compareTo(b.libelle));
    final disciplines = (fiche.avantages ?? [])
        .where((a) => a.type == 'discipline')
        .toList()
      ..sort((a, b) => a.libelle.compareTo(b.libelle));
    final vertues = (fiche.avantages ?? [])
        .where((a) => a.type == 'vertue')
        .toList()
      ..sort((a, b) => a.ordre - b.ordre);

    return layout == LayoutType.wide
        ? Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Historiques(historiques),
              ),
              Expanded(child: Disciplines(disciplines)),
              Expanded(child: Vertues(vertues)),
            ],
          )
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Historiques(historiques, layout: layout),
              const SizedBox(height: 24),
              Disciplines(disciplines, layout: layout),
              const SizedBox(height: 24),
              Vertues(vertues, layout: layout),
            ],
          );
  }
}

class Historiques extends AttributesColumn {
  Historiques(
    List<Avantage> historiques, {
    super.layout,
    super.key,
  }) : super(
          label: 'Historiques',
          attributes: [
            ...historiques
                .map((a) => Attribute(name: a.libelle, value: a.points)),
            ...List.filled(7 - historiques.length, const Attribute(value: 0))
          ],
        );
}

class Disciplines extends AttributesColumn {
  Disciplines(
    List<Avantage> disciplines, {
    super.layout,
    super.key,
  }) : super(
          label: 'Disciplines',
          attributes: [
            ...disciplines
                .map((a) => Attribute(name: a.libelle, value: a.points)),
            ...List.filled(7 - disciplines.length, const Attribute(value: 0))
          ],
        );
}

class Vertues extends AttributesColumn {
  Vertues(
    List<Avantage> vertues, {
    super.layout,
    super.key,
  }) : super(
          label: 'Vertues',
          attributes: vertues
              .map((a) => Attribute(name: a.libelle, value: a.points))
              .toList(),
        );
}
