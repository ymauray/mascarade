import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mascarade/model/attribute.dart';
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
    return layout == LayoutType.wide
        ? Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(child: Historiques()),
              Expanded(child: Disciplines()),
              Expanded(child: Vertues()),
            ],
          )
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Historiques(layout: layout),
              const SizedBox(height: 24),
              Disciplines(layout: layout),
              const SizedBox(height: 24),
              Vertues(layout: layout),
            ],
          );
  }
}

class Historiques extends AttributesColumn {
  Historiques({
    super.layout,
    super.key,
  }) : super(
          label: 'Historiques',
          attributes: [
            const Attribute(value: 0),
            const Attribute(value: 0),
            const Attribute(value: 0),
            const Attribute(value: 0),
            const Attribute(value: 0),
            const Attribute(value: 0),
            const Attribute(value: 0),
          ],
        );
}

class Disciplines extends AttributesColumn {
  Disciplines({
    super.layout,
    super.key,
  }) : super(
          label: 'Disciplines',
          attributes: [
            const Attribute(value: 0),
            const Attribute(value: 0),
            const Attribute(value: 0),
            const Attribute(value: 0),
            const Attribute(value: 0),
            const Attribute(value: 0),
            const Attribute(value: 0),
          ],
        );
}

class Vertues extends AttributesColumn {
  Vertues({
    super.layout,
    super.key,
  }) : super(
          label: 'Vertues',
          attributes: [
            const Attribute(name: 'Conscience/\nConviction', value: 0),
            const Attribute(name: 'Maîtrise de soi/\nInstinct', value: 0),
            const Attribute(name: 'Courage', value: 0),
          ],
        );
}
