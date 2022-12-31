import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mascarade/model/attribute.dart';
import 'package:mascarade/widget/attributes_column.dart';

class AttributesSection extends ConsumerWidget {
  const AttributesSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      children: [
        Expanded(child: PhysicalAttributes()),
        Expanded(child: SocialAttributes()),
        Expanded(child: MentalAttributes()),
      ],
    );
  }
}

class PhysicalAttributes extends AttributesColumn {
  PhysicalAttributes({super.key})
      : super(
          label: 'Physique',
          attributes: [
            Attribute(
              name: 'Force',
              value: 1,
            ),
            Attribute(
              name: 'Dextérité',
              value: 1,
            ),
            Attribute(
              name: 'Vigeur',
              value: 1,
            ),
          ],
        );
}

class SocialAttributes extends AttributesColumn {
  SocialAttributes({super.key})
      : super(
          label: 'Social',
          attributes: [
            Attribute(
              name: 'Charisme',
              value: 1,
            ),
            Attribute(
              name: 'Manipulation',
              value: 1,
            ),
            Attribute(
              name: 'Apparence',
              value: 1,
            ),
          ],
        );
}

class MentalAttributes extends AttributesColumn {
  MentalAttributes({super.key})
      : super(
          label: 'Mental',
          attributes: [
            Attribute(
              name: 'Perception',
              value: 1,
            ),
            Attribute(
              name: 'Intelligence',
              value: 1,
            ),
            Attribute(
              name: 'Astuce',
              value: 1,
            ),
          ],
        );
}
