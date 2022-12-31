import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mascarade/model/attribute.dart';
import 'package:mascarade/widget/attributes_column.dart';

class CapacitiesSection extends ConsumerWidget {
  const CapacitiesSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      children: [
        Expanded(child: Talents()),
        Expanded(child: Competences()),
        Expanded(child: Connaissances()),
      ],
    );
  }
}

class Talents extends AttributesColumn {
  Talents({super.key})
      : super(
          label: 'Talents',
          attributes: [
            Attribute(
              name: 'Vigilance',
              value: 0,
            ),
            Attribute(
              name: 'Athlétisme',
              value: 0,
            ),
            Attribute(
              name: 'Bagarre',
              value: 0,
            ),
            Attribute(
              name: 'Esquive',
              value: 0,
            ),
            Attribute(
              name: 'Empathie',
              value: 0,
            ),
            Attribute(
              name: 'Expression',
              value: 0,
            ),
            Attribute(
              name: 'Intimidation',
              value: 0,
            ),
            Attribute(
              name: 'Commandement',
              value: 0,
            ),
            Attribute(
              name: 'Expérience de la rue',
              value: 0,
            ),
            Attribute(
              name: 'Subterfuge',
              value: 0,
            ),
          ],
        );
}

class Competences extends AttributesColumn {
  Competences({super.key})
      : super(
          label: 'Compétences',
          attributes: [
            Attribute(
              name: 'Animaux',
              value: 0,
            ),
            Attribute(
              name: 'Artisanat',
              value: 0,
            ),
            Attribute(
              name: 'Conduite',
              value: 0,
            ),
            Attribute(
              name: 'Etiquette',
              value: 0,
            ),
            Attribute(
              name: 'Armes à feu',
              value: 0,
            ),
            Attribute(
              name: 'Mêlée',
              value: 0,
            ),
            Attribute(
              name: 'Représentation',
              value: 0,
            ),
            Attribute(
              name: 'Sécurité',
              value: 0,
            ),
            Attribute(
              name: 'Furtivité',
              value: 0,
            ),
            Attribute(
              name: 'Survie',
              value: 0,
            ),
          ],
        );
}

class Connaissances extends AttributesColumn {
  Connaissances({super.key})
      : super(
          label: 'Connaissances',
          attributes: [
            Attribute(
              name: 'Erudition',
              value: 0,
            ),
            Attribute(
              name: 'Informatique',
              value: 0,
            ),
            Attribute(
              name: 'Finances',
              value: 0,
            ),
            Attribute(
              name: 'Investigation',
              value: 0,
            ),
            Attribute(
              name: 'Droit',
              value: 0,
            ),
            Attribute(
              name: 'Linguistique',
              value: 0,
            ),
            Attribute(
              name: 'Médicine',
              value: 0,
            ),
            Attribute(
              name: 'Occultisme',
              value: 0,
            ),
            Attribute(
              name: 'Politique',
              value: 0,
            ),
            Attribute(
              name: 'Sciences',
              value: 0,
            ),
          ],
        );
}
