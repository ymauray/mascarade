import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mascarade/model/attribute.dart';
import 'package:mascarade/model/fiche.dart';
import 'package:mascarade/provider/fiche_provider.dart';
import 'package:mascarade/utils/layout_type.dart';
import 'package:mascarade/widget/attributes_column.dart';

class CapacitiesSection extends ConsumerWidget {
  const CapacitiesSection({
    this.layout = LayoutType.wide,
    super.key,
  });

  final LayoutType layout;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final fiche = ref.watch(ficheProvider);

    return layout == LayoutType.wide
        ? Row(
            children: [
              Expanded(child: Talents(fiche)),
              Expanded(child: Competences(fiche)),
              Expanded(child: Connaissances(fiche)),
            ],
          )
        : Column(
            children: [
              Talents(fiche, layout: layout),
              const SizedBox(height: 24),
              Competences(fiche, layout: layout),
              const SizedBox(height: 24),
              Connaissances(fiche, layout: layout),
            ],
          );
  }
}

class Talents extends AttributesColumn {
  Talents(
    Fiche fiche, {
    super.layout,
    super.key,
  }) : super(
          label: 'Talents',
          attributes: [
            Attribute(
              name: 'Vigilance',
              value: fiche.vigilance ?? 0,
            ),
            Attribute(
              name: 'Athlétisme',
              value: fiche.athletisme ?? 0,
            ),
            Attribute(
              name: 'Bagarre',
              value: fiche.bagarre ?? 0,
            ),
            Attribute(
              name: 'Esquive',
              value: fiche.esquive ?? 0,
            ),
            Attribute(
              name: 'Empathie',
              value: fiche.empathie ?? 0,
            ),
            Attribute(
              name: 'Expression',
              value: fiche.expression ?? 0,
            ),
            Attribute(
              name: 'Intimidation',
              value: fiche.intimidation ?? 0,
            ),
            Attribute(
              name: 'Commandement',
              value: fiche.commandement ?? 0,
            ),
            Attribute(
              name: 'Exp. de la rue',
              value: fiche.connaissanceDeLaRue ?? 0,
            ),
            Attribute(
              name: 'Subterfuge',
              value: fiche.subterfuge ?? 0,
            ),
          ],
        );
}

class Competences extends AttributesColumn {
  Competences(
    Fiche fiche, {
    super.layout,
    super.key,
  }) : super(
          label: 'Compétences',
          attributes: [
            Attribute(
              name: 'Animaux',
              value: fiche.animaux ?? 0,
            ),
            Attribute(
              name: 'Artisanat',
              value: fiche.artisanat ?? 0,
            ),
            Attribute(
              name: 'Conduite',
              value: fiche.conduite ?? 0,
            ),
            Attribute(
              name: 'Etiquette',
              value: fiche.etiquette ?? 0,
            ),
            Attribute(
              name: 'Armes à feu',
              value: fiche.armesAFeu ?? 0,
            ),
            Attribute(
              name: 'Mêlée',
              value: fiche.melee ?? 0,
            ),
            Attribute(
              name: 'Représentation',
              value: fiche.representation ?? 0,
            ),
            Attribute(
              name: 'Sécurité',
              value: fiche.securite ?? 0,
            ),
            Attribute(
              name: 'Furtivité',
              value: fiche.furtivite ?? 0,
            ),
            Attribute(
              name: 'Survie',
              value: fiche.survie ?? 0,
            ),
          ],
        );
}

class Connaissances extends AttributesColumn {
  Connaissances(
    Fiche fiche, {
    super.layout,
    super.key,
  }) : super(
          label: 'Connaissances',
          attributes: [
            Attribute(
              name: 'Erudition',
              value: fiche.erudition ?? 0,
            ),
            Attribute(
              name: 'Informatique',
              value: fiche.informatique ?? 0,
            ),
            Attribute(
              name: 'Finances',
              value: fiche.finances ?? 0,
            ),
            Attribute(
              name: 'Investigation',
              value: fiche.investigation ?? 0,
            ),
            Attribute(
              name: 'Droit',
              value: fiche.droit ?? 0,
            ),
            Attribute(
              name: 'Linguistique',
              value: fiche.linguistique ?? 0,
            ),
            Attribute(
              name: 'Médecine',
              value: fiche.medecine ?? 0,
            ),
            Attribute(
              name: 'Occultisme',
              value: fiche.occultisme ?? 0,
            ),
            Attribute(
              name: 'Politique',
              value: fiche.politique ?? 0,
            ),
            Attribute(
              name: 'Sciences',
              value: fiche.science ?? 0,
            ),
          ],
        );
}
