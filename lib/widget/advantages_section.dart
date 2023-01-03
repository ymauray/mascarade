import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mascarade/model/attribute.dart';
import 'package:mascarade/widget/attributes_column.dart';

class AdvantagesSection extends ConsumerWidget {
  const AdvantagesSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(child: Historiques()),
        Expanded(child: Disciplines()),
        Expanded(child: Vertues()),
      ],
    );
  }
}

class Historiques extends AttributesColumn {
  Historiques({super.key})
      : super(
          label: 'Historiques',
          attributes: [
            Attribute(value: 0),
            Attribute(value: 0),
            Attribute(value: 0),
            Attribute(value: 0),
            Attribute(value: 0),
            Attribute(value: 0),
            Attribute(value: 0),
          ],
        );
}

class Disciplines extends AttributesColumn {
  Disciplines({super.key})
      : super(
          label: 'Disciplines',
          attributes: [
            Attribute(value: 0),
            Attribute(value: 0),
            Attribute(value: 0),
            Attribute(value: 0),
            Attribute(value: 0),
            Attribute(value: 0),
            Attribute(value: 0),
          ],
        );
}

class Vertues extends AttributesColumn {
  Vertues({super.key})
      : super(
          label: 'Vertues',
          attributes: [
            Attribute(name: 'Conscience/\nConviction', value: 0),
            Attribute(name: 'Maîtrise de soi/\nInstinct', value: 0),
            Attribute(name: 'Courage', value: 0),
          ],
        );
}
