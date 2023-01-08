import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mascarade/model/attribute.dart';
import 'package:mascarade/model/fiche.dart';
import 'package:mascarade/provider/fiche_provider.dart';
import 'package:mascarade/utils/lyout_type.dart';
import 'package:mascarade/widget/attributes_column.dart';

class AttributesSection extends ConsumerWidget {
  const AttributesSection({
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
              Expanded(
                child: PhysicalAttributes(fiche),
              ),
              Expanded(
                child: SocialAttributes(fiche),
              ),
              Expanded(
                child: MentalAttributes(fiche),
              ),
            ],
          )
        : Column(
            children: [
              PhysicalAttributes(fiche, layout: layout),
              const SizedBox(height: 24),
              SocialAttributes(fiche, layout: layout),
              const SizedBox(height: 24),
              MentalAttributes(fiche, layout: layout),
            ],
          );
  }
}

class PhysicalAttributes extends AttributesColumn {
  PhysicalAttributes(
    Fiche fiche, {
    super.layout,
    super.key,
  }) : super(
          label: 'Physique',
          attributes: [
            Attribute(
              name: 'Force',
              value: fiche.force ?? 1,
            ),
            Attribute(
              name: 'Dextérité',
              value: fiche.dexterite ?? 1,
            ),
            Attribute(
              name: 'Vigeur',
              value: fiche.vigeur ?? 1,
            ),
          ],
        );
}

class SocialAttributes extends AttributesColumn {
  SocialAttributes(
    Fiche fiche, {
    super.layout,
    super.key,
  }) : super(
          label: 'Social',
          attributes: [
            Attribute(
              name: 'Charisme',
              value: fiche.charisme ?? 1,
            ),
            Attribute(
              name: 'Manipulation',
              value: fiche.manipulation ?? 1,
            ),
            Attribute(
              name: 'Apparence',
              value: fiche.apparence ?? 1,
            ),
          ],
        );
}

class MentalAttributes extends AttributesColumn {
  MentalAttributes(
    Fiche fiche, {
    super.layout,
    super.key,
  }) : super(
          label: 'Mental',
          attributes: [
            Attribute(
              name: 'Perception',
              value: fiche.intelligence ?? 1,
            ),
            Attribute(
              name: 'Intelligence',
              value: fiche.perception ?? 1,
            ),
            Attribute(
              name: 'Astuce',
              value: fiche.astuce ?? 1,
            ),
          ],
        );
}
